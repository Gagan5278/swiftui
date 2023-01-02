//
//  LocationDetialView.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2023/01/02.
//

import SwiftUI
import MapKit
struct LocationDetialView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    let location: Location
    var body: some View {
        ScrollView{
            imageTabView
            locationTitle
            Divider()
            locationDescription
            Divider()
            locationLayer
        }
        .background(.thickMaterial)
        .ignoresSafeArea()
        .overlay(
            closeButton, alignment: .topLeading
        )
    }
}

struct LocationDetialView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetialView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}

extension LocationDetialView {
    private var imageTabView: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 500)
        .shadow(color: Color.black.opacity(0.4), radius: 10)
    }
    
    private var locationTitle: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title)
                Text(location.cityName)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var locationDescription: some View {
        VStack(alignment: .leading) {
            Text(location.description)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var locationLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: locationViewModel.span)), annotationItems: [location], annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapPinView()
            }
        })
        .aspectRatio(1, contentMode: .fill)
        .allowsHitTesting(false)
    }
    
    private var closeButton: some View {
        Button {
            locationViewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.primary)
                .frame(width: 20, height: 20)
                .padding()
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding()
        }

    }
}
