////
////  ContentView.swift
////  WeSplit
////
////  Created by Aishwarya Raja on 9/17/24.
////
///
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    @State private var showConfirmation = false
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalTipAmount: Double{
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        
        return tipValue
    }
    
    
    var totalCheckAmount:Double{
        // do only checkamount and tip percentage calculation
        
        let grandTotal = checkAmount + totalTipAmount
        
        return grandTotal
    }
    var totalPerPerson:Double{
        //do calculations
        let peopleCount = Double(numberOfPeople)
        
        let amountPerHead = totalCheckAmount / peopleCount
        
        return amountPerHead

    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Amount"){
                    TextField("Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                    
                    Section("Number of People"){
                        Stepper(value:$numberOfPeople, in: 2...10){
                            Text("\(numberOfPeople) People")
                        }
                    }
//                        ForEach(numberOfPeople, id: \.self){
//                            
//                            Text("\($0) People" )
//                        }
//                    }
//                    .pickerStyle(.navigationLink)
                    
                    
                    
                
                
                Section("How much tip do you want to leave?"){
                    
                    Picker("Tip Percentage", selection: $tipPercentage){
                        
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    
                    .pickerStyle(.segmented) // segmented control
                }
                
                Section("Total Tip Amount"){
                    Text(totalTipAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Total Check Amount"){
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount Per Person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    Text(checkAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                // add the pay button
                Button(action: {
                    showConfirmation = true
                }) {
                    Text("Pay \(totalCheckAmount ,  format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
              
                    
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
}
    

#Preview {
    ContentView()
}


