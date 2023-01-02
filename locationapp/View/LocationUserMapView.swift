//
//  MapView.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/28.
//

import SwiftUI
import MapKit
struct LocationUserMapView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    @State private var coordinateRegion = MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack {
                Button {
                    locationViewModel.toggleListViewVisibility()
                } label: {
                    header
                }
                Spacer()
                locationPreview
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(2.0)
                    .shadow(radius: 3)
            }
        }
        .sheet(item: $locationViewModel.sheetLocation) { location in
            LocationDetialView(location: location)
        }

    }
}

struct LocationUserMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationUserMapView().environmentObject(LocationViewModel())
    }
}

extension LocationUserMapView {
    var header: some View {
        VStack {
            Text(locationViewModel.mapLocation.name + ", " + locationViewModel.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: locationViewModel.mapLocation.name)
                .overlay(alignment: Alignment.leading) {
                    Image(systemName: "arrow.down")
                        .font(.title)
                        .padding()
                        .rotationEffect(locationViewModel.shouldShowLocationList ? Angle(degrees: 180) : Angle(degrees: 0))
                }
            if(locationViewModel.shouldShowLocationList) {
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
        .padding()
        
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $locationViewModel.coordinateRegion, annotationItems: locationViewModel.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapPinView()
                    .scaleEffect(location == locationViewModel.mapLocation ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        locationViewModel.updateMap(with: location)
                    }
            }
        })
    }
    
    private var locationPreview: some View {
        ZStack {
            ForEach(locationViewModel.locations) { location in
                if (location == locationViewModel.mapLocation) {
                    LocationPreviewView(location: locationViewModel.mapLocation)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
