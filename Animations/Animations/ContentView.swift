//
//  ContentView.swift
//  Animations
//
//  Created by Aishwarya Raja on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me"){
            withAnimation{
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount),axis: (x: 0 , y: 1 , z: 0))
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(
//                    .easeInOut(duration: 1)
//                    .repeatForever(autoreverses: false),
//                    value: animationAmount
//                
//                )
//        
//        
//            
//        )
//        .onAppear{
//            animationAmount = 2
//        }
//        .blur(radius: (animationAmount - 1) * 3)
//        .scaleEffect(animationAmount)
//        .animation(
//            .easeInOut(duration: 2)
//            /*.delay(1),*/ // delay waits for 1 second before executing 2 sec animation
//                .repeatCount(4, autoreverses: false),
//        value: animationAmount
//        )
    }
}

#Preview {
    ContentView()
}
