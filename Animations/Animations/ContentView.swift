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
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .blur(radius: (animationAmount - 1) * 3)
        .scaleEffect(animationAmount)
        .animation(.default , value: animationAmount)
    }
}

#Preview {
    ContentView()
}
