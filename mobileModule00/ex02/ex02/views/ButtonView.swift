//
//  ButtonView.swift
//  ex02
//
//  Created by Sungwoo Park on 8/31/23.
//

import SwiftUI

struct ButtonView: View {
    let rows = [
            ["7", "8", "9", "C", "AC"],
            ["4", "5", "6", "+", "-"],
            ["1", "2", "3", "×", "/"],
            ["0", ".", "00", "=", ""]
        ]
    
    var body: some View {
        VStack {
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(row, id: \.self) { column in
                            Button(action: {
                                print("Button pressed: \(column)")
                            }) {
                                Text(column)
                                    .font(.title)
                                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                            }
                            .foregroundColor(.gray)
                            .disabled(column.isEmpty)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ButtonView()
}
