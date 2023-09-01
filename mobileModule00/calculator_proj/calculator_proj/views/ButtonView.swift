//
//  ButtonView.swift
//  calculator_proj
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
    @Binding var rawInput: String
    
    var body: some View {
        VStack {
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(row, id: \.self) { column in
                            Button(action: {
                                onButtonClicked(value: column)
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
    
    func onButtonClicked(value: String) {
        print("Button pressed: \(value)")
        if (value == "AC") {
            rawInput = "0"
            return
        }
        let lastChar = rawInput.last!
        if ((lastChar == "=" && (Character(value).isNumber || value == ".")) || (rawInput == "0")) {
            rawInput = ""
        } else if (lastChar == "=" && value != "C" && value != "AC") {
            let result = calRawInput(rawInput: rawInput)
            rawInput = result.isInfinite ? "" : String()
        }
        switch value {
        case "C":
            if (rawInput.isEmpty == false) { rawInput.removeLast() }
        case "-":
            if (lastChar == "-") { return }
            if (lastChar == ".") { rawInput.removeLast() }
            rawInput += value
        case "+", "×", "/":
            if (lastChar == "-") { rawInput.removeLast() }
            if (rawInput.isEmpty) { rawInput = "0" }
            else if (rawInput.last! == "+" ||
                rawInput.last! == "×" ||
                rawInput.last! == "/") {
                rawInput.removeLast()
            }
            rawInput += value
        case "=":
            while (rawInput.isEmpty == false && rawInput.last!.isNumber == false) {
                rawInput.removeLast()
            }
            if (rawInput.isEmpty) { rawInput = "0" }
            rawInput += value
        case "0", "00":
            if (rawInput == "0") {return}
            if (rawInput.count > 1) {
                let twoBefore = rawInput[rawInput.index(rawInput.endIndex, offsetBy: -2)]
                if (lastChar == "0" && (twoBefore == "+" || twoBefore == "-" || twoBefore == "×" || twoBefore == "/")) {
                    return
                }
            }
            if (lastChar == "+" || lastChar == "-" || lastChar == "×" || lastChar == "/") {
                rawInput += "0"
            } else {
                rawInput += value
            }
            if (rawInput == "00") { rawInput.removeLast() }
        case ".":
            if (rawInput.isEmpty || lastChar == "+" || lastChar == "-" || lastChar == "×" || lastChar == "/") {
                rawInput += "0"
            }
            rawInput += value
        default:
            rawInput += value
        }
        if (rawInput.isEmpty) { rawInput = "0" }
    }
}


#Preview {
    ButtonView(rawInput: .constant(""))
}
