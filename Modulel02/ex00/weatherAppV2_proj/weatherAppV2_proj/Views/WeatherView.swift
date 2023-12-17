//
//  WeatherView.swift
//  weatherAppV2_proj
//
//  Created by Sungwoo Park on 9/11/23.
//

import SwiftUI

struct WeatherView: View {
    @State var selectedBottomItem: BottombarItem = .currently
    @State var submitText = ""
    
    let minDragTranslationForSwipe: CGFloat = 50
    
    var body: some View {
        TopbarView(submitText: $submitText)
            .padding(20)
        TabView (selection: $selectedBottomItem) {
            ForEach(BottombarItem.allCases, id: \.rawValue) { item in
                NavigationStack {
                    VStack {
                        Text(item.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(submitText)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                }
                .tabItem {
                    VStack {
                        Image(systemName: item.systemImage)
                        Text(item.name)
                    }
                }
                .tag(item)
                .highPriorityGesture(DragGesture().onEnded({
                    handleSwipe(translation: $0.translation.width)
                }))
            }
        }
    }
    
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe{
            selectedBottomItem = selectedBottomItem.prev
        } else if translation < -minDragTranslationForSwipe {
            selectedBottomItem = selectedBottomItem.next
        }
    }
}

#Preview {
    WeatherView()
}
