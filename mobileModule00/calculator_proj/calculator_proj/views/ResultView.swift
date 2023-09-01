//
//  ResultView.swift
//  calculator_proj
//
//  Created by Sungwoo Park on 8/31/23.
//

import SwiftUI

struct ResultView: View {
    let rawInput: String
    var body: some View {
        VStack {
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: .topLeading)
            HStack {
                Spacer()
                Text(rawInput)
                    .font(.title)
            }
            HStack {
                Spacer()
                Text("\(calFormatRawInput(rawInput: rawInput))")
                    .font(.title)
            }
        }
        .padding(.trailing, 20)
    }
}

#Preview {
    ResultView(rawInput: "1+2")
}
