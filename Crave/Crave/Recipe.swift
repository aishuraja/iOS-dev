//
//  Recipe.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/12/25.
//

import Foundation

// step 1 : Model - Define the struct of this app
struct Recipe: Decodable, Identifiable{
    let id : UUID
    let name: String
    let cuisine : String
    let photoURLLarge : URL?
    let photoURLSmall : URL?
    let sourceURL :URL?
    let youtubeURL : URL?
    let description: String?
    
    enum CodingKeys : String,CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
        case description
        
    }
    
}
