//
//  LocationMapPinView.swift
//  locationapp
//
//  Created by Gagan Vishal  on 2023/01/02.
//

import SwiftUI

struct LocationMapPinView: View {
    var body: some View {
        VStack {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(.red)
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 180))
                .offset(x:0, y:-6)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapPinView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapPinView()
    }
}
