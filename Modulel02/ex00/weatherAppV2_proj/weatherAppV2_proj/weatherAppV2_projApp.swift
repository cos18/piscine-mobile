//
//  weatherAppV2_projApp.swift
//  weatherAppV2_proj
//
//  Created by Sungwoo Park on 9/11/23.
//

import SwiftUI

@main
struct weatherAppV2_projApp: App {
    private var locationModel = LocationService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationModel)
        }
    }
}
