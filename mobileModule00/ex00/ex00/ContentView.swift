//
//  ContentView.swift
//  ex00
//
//  Created by Sungwoo Park on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("A simple text")
                .font(.title)
            Button(action: {
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
