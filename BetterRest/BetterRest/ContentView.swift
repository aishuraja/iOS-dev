//
//  ContentView.swift
//  BetterRest
//
//  Created by Aishwarya Raja on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeConsume = 1
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Desired time to wake up")
                    .font(.headline)
                DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Sleep Amount you prefer")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25 )
                Text("Your coffee cups count")
                    .font(.headline)
                Stepper("\(coffeeConsume) cup(s)", value: $coffeeConsume,in: 1...20)
                    
                    
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("calculate", action: calculateBedTime)
            }
        }
        .preferredColorScheme(.dark)
    }
    func calculateBedTime(){
        // perform calculation
    }
        
}

#Preview {
    ContentView()
}
