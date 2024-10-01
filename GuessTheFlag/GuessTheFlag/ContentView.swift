//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aishwarya Raja on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    // 2 properties to run the game
    // 1. store the array of all country on our game data
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    //2. int storing the correct image
    @State var correctAnswer = Int.random(in: 0...3)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [.gray, .black], center: .top, startRadius: 20, endRadius: 400)
            
            
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                        
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.yellow)
                        
                    }
                    
                    // accessing the first four elements of a "shuffled array".
                    ForEach(0..<4){number in
                        Button{
                            flagTapped(number)
                            
                            
                        }label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 20)
//                .background(.regularMaterial)
//                .clipShape(.rect(cornerRadius: 20))
//                .padding()
                Spacer()
                Spacer()
                
                Text("Current Score: \(score)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                
                Spacer()
                    
            }
           
                
                    .alert(scoreTitle, isPresented: $showingScore){
                        Button("Continue", role: .destructive,action: askQuestion)
                        
                    } message: {
                        Text("Your score is \(score)")
                    }
                
                
                
            }
        
        
        
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct"
            score = score+1
            
        }
        else{
            scoreTitle = "Wrong"
//            score = score-1
            
        }
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...3)
    }

}

#Preview {
    ContentView()
}
