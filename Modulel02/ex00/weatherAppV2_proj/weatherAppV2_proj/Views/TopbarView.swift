//
//  TopbarView.swift
//  weatherAppV2_proj
//
//  Created by Sungwoo Park on 9/11/23.
//

import SwiftUI
import CoreLocation

struct TopbarView: View {
    @EnvironmentObject var locationModel: LocationService
    @State var searchText = ""
    @Binding var submitText: String
    
    var coordinate: CLLocationCoordinate2D? {
        locationModel.lastSeenLocation?.coordinate
    }
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Location", text: $searchText)
                .onSubmit {
                    submitText = searchText
                    searchText = ""
                }
            Button(action: onGPSClicked) {
                Image(systemName: "location.fill")
            }
        }
    }
    
    func onGPSClicked() {
        // submitText = "Geolocation"
        print(locationModel.status)
        switch locationModel.status {
        case .notDetermined:
            locationModel.requestPermission()
        case .restricted:
            submitText = "Location use is restricted."
        case .denied:
            submitText = "The app does not have location permissions. Please enable them in settings."
        case .authorizedAlways, .authorizedWhenInUse:
            submitText = String(coordinate?.latitude ?? 0) + " / " + String(coordinate?.longitude ?? 0)
        default:
            submitText = "Unexpected status"
        }
    }
}

#Preview {
    TopbarView(submitText: .constant("test"))
}
