//
//  ContentView.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else if viewModel.recipes.isEmpty {
                        Text("No recipes available.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List(viewModel.recipes) { recipe in
                            RecipeRow(recipe: recipe, viewModel: viewModel)
                        }
                        .listStyle(.plain)
                        .refreshable { // Pull-to-refresh
                            print("Pull-to-refresh triggered")
                            await viewModel.fetchRecipes()
                        }
                    }
                }

                // Loading Spinner
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .padding()
                }

//                // Floating Refresh Button
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            Task {
//                                await viewModel.fetchRecipes()
//                            }
//                        }) {
//                            Image(systemName: "arrow.clockwise")
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.blue)
//                                .clipShape(Circle())
//                                .shadow(radius: 10)
//                        }
//                        .padding()
//                    }
//                }
            }
            .navigationTitle("Recipes")
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
        }
        .task {
            await viewModel.fetchRecipes()
        }
    }
}


#Preview {
    ContentView()}
