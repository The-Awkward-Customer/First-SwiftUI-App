//
//  MapView.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    //private variables live outside of the body but within the struct
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
    center: coordinate,
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.116_868))
}
