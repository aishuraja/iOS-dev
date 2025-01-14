//
//  RecipeRow.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/12/25.
//

// step 4: The purpose of this view is to work on single recipe in a horizontal row layout. Mostly working with the display how the recipe should look

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    @ObservedObject var viewModel: RecipeViewModel
    @State private var image: UIImage? // State for storing the loaded image

    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            HStack {
                // Recipe Image
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .onAppear {
                            loadImage() // Trigger image loading
                        }
                }

                // Recipe Name and Cuisine
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    Text(recipe.cuisine)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    // Function to Load Image Asynchronously
    private func loadImage() {
        Task {
            if let url = recipe.photoURLSmall {
                self.image = await viewModel.loadImage(for: url)
            }
        }
    }
}
