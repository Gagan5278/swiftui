//
//  locationappApp.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/27.
//

import SwiftUI

@main
struct locationappApp: App {
    @StateObject var locationViewModel: LocationViewModel = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationUserMapView().environmentObject(locationViewModel)
        }
    }
}
