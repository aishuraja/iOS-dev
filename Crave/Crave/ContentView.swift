//
//  ContentView.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/10/25.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var searchText: String = "" // For the search bar

    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.cuisine.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            
            
            VStack {
                
                // Search Bar
                TextField("Search Recipes...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Featured Items Section
                    
                if !viewModel.featuredRecipes.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Featured Recipes")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.featuredRecipes) { recipe in
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                        FeaturedRecipeCard(recipe: recipe)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 150) // Adjust height for featured section
                    }
                }
                  

                // Main List of Recipes
                   
                
                List(filteredRecipes) { recipe in
                    RecipeRow(recipe: recipe, viewModel: viewModel)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Crave")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            await viewModel.fetchRecipes()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .task {
                await viewModel.fetchRecipes()
            }
        }
    }
}


#Preview {
    ContentView()}
