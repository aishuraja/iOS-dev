//
//  ContentView.swift
//  PocketPlan
//
//  Created by Aishwarya Raja on 12/25/24.
//

import SwiftUI

struct Expenses : Identifiable {
    let id = UUID()
    let name: String
    let amount : Double
    let type: String
    
}

@Observable
class ExpenseTrack {
    var items = [Expenses]() // Array of expenses
    
}

struct ContentView: View {
    @State private var exp = ExpenseTrack()
    var body: some View {
        NavigationStack{
            List{
                ForEach(exp.items){ item in
                    Text(item.name)
                    
                }.onDelete(perform: removeItems)
            }.navigationTitle("Pocket-Plan")
                .toolbar{
                    Button("Add item", systemImage: "plus"){
                        let addedExpense = Expenses(name: "Food", amount: 5, type: "Personal" )
                        exp.items.append(addedExpense)
                    }
                    
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
