//
//  ContentView.swift
//  ex00
//
//  Created by Sungwoo Park on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isButtonClicked = false
    
    var body: some View {
        VStack {
            Text(isButtonClicked ? "Hello World" : "A simple text")
                .font(.title)
            Button(action: {
                isButtonClicked.toggle()
                print("Button pressed")
            }, label: {
                Text("Click me")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
