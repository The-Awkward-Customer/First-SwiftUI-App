//
//  Landmark.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    
//     handles JSON data
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
        
//      handles image assets
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
//    handles Coordinates
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
