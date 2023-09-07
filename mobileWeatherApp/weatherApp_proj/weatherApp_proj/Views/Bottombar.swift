//
//  BottomBar.swift
//  weatherApp_proj
//
//  Created by Sungwoo Park on 9/6/23.
//

import SwiftUI

struct Bottombar: View {
    @Binding var selectedItem: BottombarItem
    
    var body: some View {
        HStack {
            ForEach(BottombarItem.allCases, id: \.rawValue) { item in
                Button(action: {
                    selectedItem = item
                }) {
                    VStack {
                        Image(systemName: item.systemImage)
                            .font(.title)
                        Text(item.name)
                            .font(.subheadline)
                    }
                    .foregroundColor(isItemSelected(item: item))
                }
            }
        }
    }
    
    
}
