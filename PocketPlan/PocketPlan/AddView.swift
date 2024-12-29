//
//  AddView.swift
//  PocketPlan
//
//  Created by Aishwarya Raja on 12/28/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    var exp : ExpenseTrack // sharing the existing instance from ContentView 
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name:", text: $name)
                
                Picker("Type:" , selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount:" ,value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }.navigationTitle("Add new expense")
                .toolbar{
                    Button("Save"){
                        let addExpense = Expenses(name: name, amount: amount, type: type)
                        exp.items.append(addExpense)
                        dismiss()
                    }
                }
        }
    }
}

#Preview {
    AddView(exp: ExpenseTrack())
}
