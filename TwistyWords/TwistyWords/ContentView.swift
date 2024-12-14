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
    
    // error
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter the word:", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section{
                    ForEach(usedWords, id: \.self){word in
                        HStack{
                            Image (systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                    }
                }
            }.navigationTitle(rootWord)
            // modifiers
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) { }
        message:{
            Text(errorMessage)
        }
            
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
        
        guard isOriginal(word: result) else {
            wordErrors(title: "Word used already", message: "Be original!")
            return
        }
        
        guard isPossible(word: result) else{
            wordErrors(title: "Look for a proper word", message: "Can't make this word from '\(rootWord)'")
            return
        }
        
        guard isReal(word: result) else {
            wordErrors(title: "Its not a actual english word", message: "You know what it is!")
            return
        }
        // add the result to the array at 0 index
        
        withAnimation{
            usedWords.insert(result, at: 0)
        }
        newWord = "" // again set newWord to empty string
        

      
    }
    
    // start the game - shows the 8 letter word
    func startGame(){
        if let startGameURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            // load file into the string
            if let startGameContents = try? String(contentsOf: startGameURL){
                
                // split the string into an array of strings, splitting on line line
                let allWords = startGameContents.components(separatedBy: "\n")
                
                // pick a random word or use default
                rootWord = allWords.randomElement() ?? "helloworld"
                
                return
                
            }
        }
            // if we are here then facing some issue - trigger a crash & report error
        fatalError("Could not load the start.txt from the bundle!")
    }
    
    // Inorder to make it work, 3 funcs are gonna be defined
    
    // 1. is it orginal word (not been used already)
    func isOriginal(word:String) -> Bool{
        !usedWords.contains(word)
    }
    
    // 2. is the word possible ( can make words from the rootword)
    func isPossible(word: String) -> Bool{
        // lets create a copy of rootword to a var and check if each letter of user inputs word is there in copy var , if it exists then remove that letter from the copy variable.
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            
            }else{
                return false
            }
        }
        return true
    }
    
    // 3.is the word is real?: check the mispelled words - use instance of UITextChecker
    func isReal(word:String) -> Bool{
        let checker = UITextChecker()
        let ranges = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: ranges, startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound // NO mispelled words are found then get back the special value NSNotFound
    }
    
    // 4. to encounter the errors
    func wordErrors(title: String , message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
        
        
    }
}


#Preview {
    ContentView()
}
