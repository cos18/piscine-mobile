//
//  BottombarItem.swift
//  weatherApp_proj
//
//  Created by Sungwoo Park on 9/6/23.
//

import Foundation

enum BottombarItem: String, CaseIterable {
    case currently
    case today
    case weekly
    
    var name: String {
        rawValue.capitalized
    }
    
    var next: BottombarItem {
        switch self {
        case .currently:
            return .today
        case .today:
            return .weekly
        case .weekly:
            return .weekly
        }
    }
    
    var prev: BottombarItem {
        switch self {
        case .currently:
            return .currently
        case .today:
            return .currently
        case .weekly:
            return .today
        }
    }
    
    var systemImage: String {
        switch self {
        case .currently:
            return "clock"
        case .today:
            return "gauge.with.dots.needle.50percent"
        case .weekly:
            return "calendar"
        }
    }
}
