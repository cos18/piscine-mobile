//
//  WeatherView.swift
//  weatherApp_proj
//
//  Created by Sungwoo Park on 9/7/23.
//

import SwiftUI

struct WeatherView: View {
    @State var searchText = ""
    @State var selectedBottomItem: BottombarItem = .currently
    @State var submitText = ""
    
    let minDragTranslationForSwipe: CGFloat = 50
    
    var body: some View {
        TabView (selection: $selectedBottomItem) {
            ForEach(BottombarItem.allCases, id: \.rawValue) { item in
                NavigationStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Location", text: $searchText)
                            .onSubmit {
                                submitText = searchText
                                searchText = ""
                            }
                        Button(action: {
                            submitText = "Geolocation"
                        }) {
                            Image(systemName: "location.fill")
                        }
                    }
                    .padding(20)
                    VStack {
                        Text(selectedBottomItem.name)
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
                    self.handleSwipe(translation: $0.translation.width)
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
