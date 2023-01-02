//
//  LocationViewModel.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/28.
//
import SwiftUI
import Foundation
import MapKit

class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location! {
        didSet {
            updateCoordinateSpan()
        }
    }
    @Published var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var shouldShowLocationList: Bool = false
    @Published var  sheetLocation: Location? = nil
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // MARK: - init
    init() {
        locations = LocationsDataService.locations
        coordinateRegion = MKCoordinateRegion()
        mapLocation = locations.first
    }
    
    private func updateCoordinateSpan() {
        withAnimation(.easeInOut) {
            coordinateRegion = MKCoordinateRegion(center: mapLocation.coordinates, span: span)
        }
    }
    
    func toggleListViewVisibility() {
        withAnimation(.easeInOut) {
            shouldShowLocationList.toggle()
        }
    }
    
    func updateMap(with location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
    
    func moveToNextLocation() {
        if let currentLocationIndex = locations.firstIndex(of: mapLocation) {
            var nextAvailbleIndex = currentLocationIndex + 1
            nextAvailbleIndex = nextAvailbleIndex >= locations.count ? 0 : nextAvailbleIndex
            withAnimation(.easeInOut) {
                mapLocation = locations[nextAvailbleIndex]
            }
        }
    }
}
