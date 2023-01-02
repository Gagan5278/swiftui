//
//  Location.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2022/11/28.
//

import Foundation
import MapKit
struct Location: Identifiable, Equatable {
    var id: String {
        return name + cityName
    }
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

