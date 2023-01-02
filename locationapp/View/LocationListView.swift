//
//  LocationListView.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/28.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var body: some View {
        List{
            ForEach(locationViewModel.locations) { location in
                if let _ = location.imageNames.first {
                    createListCity(location: location)
                      .padding()
                      .listRowBackground(Color.clear)
                      .onTapGesture {
                          updateMapOnNew(location: location)
                      }
                }
            }
            
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView().environmentObject(LocationViewModel())
    }
}

// MARK: - LocationListView Extension
extension LocationListView {
    func createListCity(location: Location) -> some View {
        HStack {
            Image(location.imageNames.first!)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title)
                    .foregroundColor(.black)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    func updateMapOnNew(location: Location) {
        locationViewModel.updateMap(with: location)
    }
}
