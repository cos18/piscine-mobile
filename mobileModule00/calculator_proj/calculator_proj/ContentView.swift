//
//  ContentView.swift
//  calculator_proj
//
//  Created by Sungwoo Park on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rawInput = "0"
    
    var body: some View {
        NavigationStack {
            GeometryReader { metrics in
                VStack {
                    ResultView(rawInput: rawInput)
                    .frame(height: metrics.size.height * 0.25, alignment: .topLeading)
                    ButtonView(rawInput: $rawInput)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color.black)
                }
            }
            .navigationTitle("Calculator")
        }
    }
}

#Preview {
    ContentView()
}
