//
//  ContentView.swift
//  PocketPlan
//
//  Created by Aishwarya Raja on 12/25/24.
//

import SwiftUI

struct Expenses : Identifiable, Codable {
    var id = UUID()
    let name: String
    let amount : Double
    let type: String
    
}

@Observable
class ExpenseTrack {
    // Array of expenses
    var items = [Expenses]() {
        didSet{ // didset property observer looks for changes in items property and write it out. 
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
            
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decoded = try? JSONDecoder().decode([Expenses].self, from: savedItems){
                items = decoded
                return
            }
        }
        
        items = []
    }
    
}

struct ContentView: View {
    @State private var exp = ExpenseTrack()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack{
            List{
                
                ForEach(exp.items){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                            
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    
                    
                }.onDelete(perform: removeItems)
            }.navigationTitle("Pocket-Plan")
                .toolbar{
                    Button("Add item", systemImage: "plus"){
//                        let addedExpense = Expenses(name: "Food", amount: 5, type: "Personal" )
//                        exp.items.append(addedExpense)
                        showingAddExpense = true 
                    }
                    
                }.sheet(isPresented: $showingAddExpense){
                    AddView(exp: exp) // passing the ExpenseTrack object from one view to another , they both will share the same object and monitor the changes
                    
                }
        }
    }
    func removeItems(at offsets: IndexSet){
        exp.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
