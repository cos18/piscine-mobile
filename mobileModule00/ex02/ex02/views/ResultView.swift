//
//  ResultView.swift
//  ex02
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
                VStack {
                    Text(rawInput)
                        .font(.title)
                    Text(rawInput)
                        .font(.title)
                }
            }
        }
        .padding(.trailing, 20)
    }
}

#Preview {
    ResultView(rawInput: "1+2")
}
