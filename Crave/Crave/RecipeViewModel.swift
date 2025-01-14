////
////  RecipeViewModel.swift
////  Crave
////
////  Created by Aishwarya Raja on 1/12/25.
////
//
import Foundation
import UIKit
//
//// step 3 : The main backend works are done here. Things such as Data Fetching , caching images , error handlings are handled here
//
//// any changes in data over here will also be displayed and reflected in the main view
//
@MainActor
class RecipeViewModel : ObservableObject{
    @Published var recipes : [Recipe] = []
    @Published var errorMessage : String?
    @Published var isLoading: Bool = false
    private let cache = ImageCache() // instance of the imagecache class
    
    // fetchRecipes method
    func fetchRecipes() async {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")! // creats the url
        
        isLoading = true // startloading
        defer { isLoading = false } // Ensure this is set to false after the method completes
        
        do{
            self.recipes = []
            print("Cleared recipes before fetching new data.")
            
            let (data,_) = try await URLSession.shared.data(from: url) // send network request to the url
            let decoded = try JSONDecoder().decode([String : [Recipe]].self, from: data)
            guard let recipes = decoded["recipes"] else {
                throw URLError(.badServerResponse)
            }
            self.recipes = recipes
            errorMessage = nil
            
            
        } catch{
            errorMessage = "Failed to load the recipes. Please try again later"
        }
    }
    
    // loadImage method
    func loadImage(for url: URL) async -> UIImage? {
        //Check the cache
        if let cacheImage = cache.getImage(for: url){
            return cacheImage
        }
        // download and save image for future use
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data){
                cache.saveImage(image, for: url)
                return image
            }
        }catch{
            print("Failed to load image: \(error)")
        }
        return nil
    }
    
    
    
    
    
    
}

