//
//  FeaturedRecipeCard.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/14/25.
//

import SwiftUI

struct FeaturedRecipeCard: View {
    let recipe: Recipe

        var body: some View {
            VStack {
                // Recipe Image
                if let url = recipe.photoURLLarge {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .clipped()
                                .cornerRadius(10)
                        } else if phase.error != nil {
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 150, height: 100)
                                .cornerRadius(10)
                        } else {
                            ProgressView()
                                .frame(width: 150, height: 100)
                        }
                    }
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 150, height: 100)
                        .cornerRadius(10)
                }

                // Recipe Name
                Text(recipe.name)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.top, 8)
            }
            .frame(width: 150) // Card width
            .padding(.horizontal, 8)
        }
}

#Preview{
    FeaturedRecipeCard(recipe: Recipe(id: UUID(),
                                      
                                      name: "strawberry Rhubarb Pie",
                                      cuisine: "British",
                                      photoURLLarge: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74cf131b-c541-4871-bed7-588a1f369c7d/large.jpg"),
                                      photoURLSmall: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74cf131b-c541-4871-bed7-588a1f369c7d/small.jpg"),
                                      sourceURL: nil,
                                      youtubeURL: nil,
                                      description: "A delicious recipe"))
}
