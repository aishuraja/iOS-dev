import SwiftUI
import WebKit

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Recipe Image
                if let photoURL = recipe.photoURLLarge {
                    AsyncImage(url: photoURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                        } else if phase.error != nil {
                            Text("Failed to load image.")
                                .foregroundColor(.red)
                        } else {
                            ProgressView()
                        }
                    }
                }

                // Recipe Title and Cuisine
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Cuisine: \(recipe.cuisine)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Recipe Description
                if let description = recipe.description {
                    Text(description)
                        .font(.body)
                        .padding(.vertical)
                } else {
                    Text("No description available.")
                        .font(.body)
                        .foregroundColor(.gray)
                }

                // YouTube Video
                if let youtubeURL = recipe.youtubeURL {
                    Text("Watch the Recipe Video:")
                        .font(.headline)
                        .padding(.top)

                    YouTubeView(videoURL: youtubeURL)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
    }
}

