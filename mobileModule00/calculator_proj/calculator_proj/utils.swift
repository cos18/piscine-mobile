//
//  utils.swift
//  calculator_proj
//
//  Created by Sungwoo Park on 8/31/23.
//

import Foundation

func calFormatRawInput(rawInput: String) -> String {
    if (rawInput.count > 70) { return "FormulaTooLong" }
    let result = calRawInput(rawInput: rawInput)
    if (floor(result) == result) {
        if (result > Double((1 << 31) - 1) || result < Double(-(1 << 31))) {
            return String(result)
        }
        return String(Int(result))
    }
    if (result.isInfinite) { return "DividedByZero" }
    return String(result)
}

func calRawInput(rawInput: String) -> Double {
    
    var numberArray: [Double] = []
    var operatorArray: [Character] = []
    let operatorCharSet = CharacterSet(charactersIn: "+-×/=")
    
    // Split String with operators
    var numberString = ""
    for r in rawInput {
        if (!numberString.isEmpty && CharacterSet(charactersIn: String(r)).isSubset(of: operatorCharSet)) {
            numberArray.append(Double(numberString) ?? 0)
            operatorArray.append(r)
            numberString = ""
        } else {numberString += String(r)}
    }
    if (!numberString.isEmpty) { numberArray.append(Double(numberString) ?? 0) }
    
    if (numberArray.count == operatorArray.count) {
        operatorArray.removeLast()
    }
    var phaseNumberArray = [numberArray[0]]
    for (idx, op) in operatorArray.enumerated() {
        if (op == "×" || op == "/") {
            var lastVal = phaseNumberArray.last!
            if (op == "×") { lastVal *= numberArray[idx + 1] }
            else { lastVal /= numberArray[idx + 1] }
            phaseNumberArray.removeLast()
            phaseNumberArray.append(lastVal)
        } else {
            phaseNumberArray.append(numberArray[idx + 1])
        }
    }
    var opIdx = 0, result: Double?
    for num in phaseNumberArray {
        if (result == nil) {
            result = num
            continue
        }
        while (opIdx < operatorArray.count && (operatorArray[opIdx] == "×" || operatorArray[opIdx] == "/")) { opIdx += 1 }
        if (operatorArray[opIdx] == "+") { result! += num }
        else { result! -= num }
        opIdx += 1
    }
    return result!
}
