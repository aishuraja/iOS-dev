//
//  ContentView.swift
//  WaveNest
//
//  Created by Aishwarya Raja on 11/28/24.
//

import SwiftUI
import AVFoundation

extension Path {
    var length: CGFloat {
        var totalLength: CGFloat = 0.0
        var previousPoint: CGPoint? = nil

        self.forEach { element in
            switch element {
            case .move(to: let point):
                previousPoint = point
            case .line(to: let point):
                if let previous = previousPoint {
                    totalLength += calculateDistance(from: previous, to: point)
                }
                previousPoint = point
            case .closeSubpath:
                break
            default:
                break
            }
        }
        return totalLength
    }

    func point(at distance: CGFloat) -> CGPoint {
        var totalLength: CGFloat = 0.0
        var previousPoint: CGPoint? = nil
        var targetPoint = CGPoint.zero

        self.forEach { element in
            switch element {
            case .move(to: let point):
                previousPoint = point
            case .line(to: let point):
                if let previous = previousPoint {
                    let segmentLength = calculateDistance(from: previous, to: point)
                    if totalLength + segmentLength >= distance {
                        let remainingDistance = distance - totalLength
                        let ratio = remainingDistance / segmentLength
                        targetPoint = interpolate(from: previous, to: point, ratio: ratio)
                        return
                    }
                    totalLength += segmentLength
                }
                previousPoint = point
            case .closeSubpath:
                break
            default:
                break
            }
        }
        return targetPoint
    }

    private func calculateDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))
    }

    private func interpolate(from: CGPoint, to: CGPoint, ratio: CGFloat) -> CGPoint {
        let x = from.x + (to.x - from.x) * ratio
        let y = from.y + (to.y - from.y) * ratio
        return CGPoint(x: x, y: y)
    }
}


// CLASS



class AudioManager: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    @Published var progress: Double = 0.0
    
    var player: AVAudioPlayer? { // Expose audioPlayer safely
           return audioPlayer
        }

    func loadAudioFile(url: URL) {
//        if let url = Bundle.main.url(forResource: "Audio", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                if let player = audioPlayer {
                               // Restore the saved playback position
                let savedTime = UserDefaults.standard.double(forKey: "lastPlayedTime")
                player.currentTime = savedTime
                progress = savedTime / player.duration
            }
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
                       }
                   }
               

    func play() {
        audioPlayer?.play()
        startProgressUpdate()
    }

    func pause() {
        audioPlayer?.pause()
        saveLastPlayedPosition()
    }

    private func startProgressUpdate() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if let player = self.audioPlayer {
                self.progress = player.currentTime / player.duration
                if player.currentTime >= player.duration {
                    timer.invalidate()
                }
            }
        }
    }

    func saveLastPlayedPosition() {
        if let player = audioPlayer {
            UserDefaults.standard.set(player.currentTime, forKey: "lastPlayedTime")
        }
    }


}

// Create filepicker view to select the files
struct FilePicker: UIViewControllerRepresentable {
    @Binding var selectedFileURL: URL?

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.audio])
        picker.delegate = context.coordinator
        picker.allowsMultipleSelection = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: FilePicker

        init(_ parent: FilePicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.selectedFileURL = urls.first
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
    }
}



// step 1 - create a path - spiral path
struct SpiralProgressPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let maxRadius = min(rect.width, rect.height) / 2
        let rotations = 3
        
        for angle in stride(from: 0.0, through: Double(rotations) * 2 * .pi, by: 0.1) {
            let normalizedAngle = CGFloat(angle)
            let radius = maxRadius * (normalizedAngle / CGFloat(rotations) / (2 * .pi))
            
            let x = center.x + radius * cos(normalizedAngle)
            let y = center.y + radius * sin(normalizedAngle)
            
            if angle == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}



// step 2 - add a custom progress bar
struct CustomProgressBar: View {
    @Binding var progress: Double
    @Binding var bookmarks: [Double]
    @ObservedObject var audioManager: AudioManager

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let path = SpiralProgressPath().path(in: geometry.frame(in: .local))
                let totalLength = path.length

                // Draw the spiral path
                path.stroke(Color.black, lineWidth: 2)

                // Calculate red dot position based on progress
                let progressLength = totalLength * CGFloat(progress)
                let redDotPosition = path.point(at: progressLength)

                // Red dot (draggable)
                Circle()
                    .fill(Color.red)
                    .frame(width: 15, height: 15)
                    .position(redDotPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Calculate progress based on drag location
                                let dragLocation = value.location
                                if let updatedProgress = calculateProgress(for: dragLocation, on: path, totalLength: totalLength) {
                                    audioManager.progress = updatedProgress
                                }
                            }
                            .onEnded { _ in
                                if let player = audioManager.player {
                                    player.currentTime = player.duration * progress
                                }
                        }
                            
                    )

                // Bookmarks
                ForEach(bookmarks, id: \.self) { bookmark in
                    let bookmarkLength = totalLength * CGFloat(bookmark)
                    let bookmarkPosition = path.point(at: bookmarkLength)

                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                        .position(bookmarkPosition)
                        .onTapGesture {
                            // Jump to the bookmark position
                            progress = bookmark
                            audioManager.progress = bookmark
                            if let player = audioManager.player { // Access the audioPlayer correctly
                                player.currentTime = player.duration * bookmark
                                audioManager.play()
                            }
                        }
                }
            }
        }
        .padding()
    }

    // Helper function to calculate progress based on drag location
    private func calculateProgress(for location: CGPoint, on path: Path, totalLength: CGFloat) -> Double? {
        var closestDistance: CGFloat = .greatestFiniteMagnitude
        var closestProgress: CGFloat?

        var currentLength: CGFloat = 0.0
        var previousPoint: CGPoint? = nil

        path.forEach { element in
            switch element {
            case .move(to: let point):
                previousPoint = point
            case .line(to: let point):
                if let previous = previousPoint {
                    let segmentLength = calculateDistance(from: previous, to: point)

                    // Check the distance from the drag location to the current segment
                    let distanceToSegment = pointToSegmentDistance(location, segmentStart: previous, segmentEnd: point)
                    if distanceToSegment < closestDistance {
                        closestDistance = distanceToSegment
                        let progressOnSegment = (currentLength + calculateDistance(from: previous, to: location)) / totalLength
                        closestProgress = progressOnSegment
                    }

                    currentLength += segmentLength
                }
                previousPoint = point
            default:
                break
            }
        }

        return closestProgress.map { Double($0) }
    }

    private func calculateDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))
    }

    private func pointToSegmentDistance(_ point: CGPoint, segmentStart: CGPoint, segmentEnd: CGPoint) -> CGFloat {
        let lineVector = CGPoint(x: segmentEnd.x - segmentStart.x, y: segmentEnd.y - segmentStart.y)
        let pointVector = CGPoint(x: point.x - segmentStart.x, y: point.y - segmentStart.y)
        let lineLengthSquared = lineVector.x * lineVector.x + lineVector.y * lineVector.y
        let dotProduct = pointVector.x * lineVector.x + pointVector.y * lineVector.y
        let t = max(0, min(1, dotProduct / lineLengthSquared))
        let projection = CGPoint(x: segmentStart.x + t * lineVector.x, y: segmentStart.y + t * lineVector.y)
        return calculateDistance(from: point, to: projection)
    }
}


// step 3 - Add buttons for play/ pause

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Circle()
                .fill(Color.blue)
                .frame(width: 70, height: 70)
                .overlay(
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(.white)
                .font(.title) // Icon size
            
        )}
    }
}

// step 4 - main fucntion - combine everything

struct AudioPlayerView: View {
    @StateObject private var audioManager = AudioManager() // Audio playback manager
    @State private var isPlaying: Bool = false // Tracks play/pause state
    @State private var bookmarks: [Double] = [] // Stores bookmark positions
    @State private var showFilePicker: Bool = false // Show file picker
    @State private var selectedFileURL: URL? // Selected file URL

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Spacer()
                Text("WaveNest")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Your Audio player")
                Spacer()

                // Custom Progress Bar
                
                CustomProgressBar(progress: $audioManager.progress, bookmarks: $bookmarks, audioManager: audioManager)
                    .frame(height: 300)
                    .padding()

                Spacer()

                // Play Button
                PlayButton(isPlaying: $isPlaying)

                // Add Bookmark Button
                Button(action: {
                    addBookmark()
                }) {
                    Text("Add Bookmark")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
                .padding(.top)

                Spacer()
                
                //upload file button
                Button(action: {
                    showFilePicker = true
                }){
                    Text("Upload Audio File")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .onAppear {
//                audioManager.loadAudioFile() // Load audio on app launch
                loadAppData() // Load saved bookmarks

            }
            .onDisappear {
                audioManager.saveLastPlayedPosition() // Save playback progress
                saveAppData() // Save bookmarks
            }
            .onChange(of: isPlaying) { newValue in
                if newValue {
                    audioManager.play() // Start or resume audio playback
                } else {
                    audioManager.pause() // Pause audio playback
                }
            }
            .sheet(isPresented: $showFilePicker, onDismiss: {
                if let url = selectedFileURL {
                    audioManager.loadAudioFile(url: url)
                }
            }) {
                FilePicker(selectedFileURL: $selectedFileURL)
            }

        }
    }

    // Add the current progress to the bookmarks array
    private func addBookmark() {
        if !bookmarks.contains(audioManager.progress) &&
            audioManager.progress > 0.0 &&
            audioManager.progress < 1.0 {
            bookmarks.append(audioManager.progress)
        }
    }
    
    // Save the progress and bookmarks to UserDefaults
    private func saveAppData(){
        UserDefaults.standard.set(audioManager.progress, forKey: "lastPlayedPosition")
        UserDefaults.standard.set(bookmarks, forKey: "bookmarks")
    }

    

    // Load the progress and bookmarks from UserDefaults
    private func loadAppData() {
        audioManager.progress = UserDefaults.standard.double(forKey: "lastPlayedPosition")
        if let savedBookmarks = UserDefaults.standard.array(forKey: "bookmarks") as? [Double] {
            bookmarks = savedBookmarks
        }
    }
       
    }


        
        
   







// preview
struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}


