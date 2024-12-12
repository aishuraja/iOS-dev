//
//  ContentView.swift
//  TwistyWords
//
//  Created by Aishwarya Raja on 11/21/24.
//

import SwiftUI

struct ContentView: View {
    @State var usedWords = [String]()
    @State var newWord = ""
    @State var rootWord = ""
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter the word:", text: $newWord)
                }
                Section{
                    ForEach(usedWords, id: \.self){word in
                        Text(word)
                    }
                }
            }.navigationTitle(rootWord)
        }
        
    }
    // To add our entry(newWord) into the list
    func addNewWord(){
        // lowercase and trim the whitespaces
        let result = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        //if result count has atleast 1 char else exist
        guard result.count > 0 else{
            return
        }
        // add the result to the array at 0 index
        usedWords.insert(result, at: 0)
        newWord = "" // again set newWord to empty string
        

      
    }
}


#Preview {
    ContentView()
}
