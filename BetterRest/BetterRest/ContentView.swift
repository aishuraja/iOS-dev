//
//  ContentView.swift
//  BetterRest
//
//  Created by Aishwarya Raja on 10/3/24.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeConsume = 1
    
//    static var defaultWakeupTime: Date{
//        var components = DateComponents()
//        components.hour = 7
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? .now
//    }
    
    // alerts
    @State private var alertTilte = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    var body: some View {
        NavigationStack{
            Form{
                VStack(alignment: .leading, spacing: 0 ){
                
                    Text("Desired time to wake up")
                        .font(.headline)
                    DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0 ){
                    Text("Sleep Amount you prefer")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25 )
                }
                
                VStack(alignment: .leading, spacing: 0 ){
                    Text("Your coffee cups count")
                        .font(.headline)
                    Stepper(coffeeConsume == 1 ? "1 cup" : "\(coffeeConsume) cups", value: $coffeeConsume,in: 1...20)
                }
                    
                    
            }
            // wrapup the alter - final stage
            .alert(alertTilte, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            
            .navigationTitle("BetterRest")
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button("calculate", action: calculateBedTime)
                    
                    //                    .frame(alignment: .topTrailing)
                    //                    .padding(200)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0)*60*60
            let minute = (components.minute ?? 0)*60
            
            
            
            // feed our values into CoreML and see the output, so we use predcition() method for this
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffeeConsume))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTilte = "Your ideal bedtime is,"
            alertMessage =  sleepTime.formatted(date: .omitted, time: .shortened)
            
            
        } catch{
            alertTilte = "Error"
            alertMessage = "Something went wrong!"
            
        }
        showingAlert = true
        
    }
        
}

#Preview {
    ContentView()
}
