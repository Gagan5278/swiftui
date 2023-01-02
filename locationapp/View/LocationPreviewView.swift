//
//  LocationPreviewView.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/28.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    var location: Location
    var body: some View {
        HStack(alignment: .bottom) {
            infoLocationBox
            Spacer()
            actionButttons
        }
        .padding(20)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(.thickMaterial)
            .offset(y:50)
            .cornerRadius(20)
        )
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
    }
}


extension LocationPreviewView {
    
    var infoLocationBox: some View {
        VStack(alignment: .leading, spacing: 4) {
            selectedLocationImage
            selectedLocationDetail
        }
    }
    
    var selectedLocationImage: some View {
        ZStack {
            Image(location.imageNames.first!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }
    
    var selectedLocationDetail: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
    
    var actionButttons: some View {
        VStack() {
            Button {
                locationViewModel.sheetLocation = location
            } label: {
                Text("Learn more")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40)
            }
            .buttonStyle(.borderedProminent)
            Button {
                locationViewModel.moveToNextLocation()
            } label: {
                Text("Next")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40)
            }
            .buttonStyle(.bordered)
        }
    }
}
