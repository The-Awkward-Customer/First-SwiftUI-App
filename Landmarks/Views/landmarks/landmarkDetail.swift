//
//  landmarkDetail.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI

struct landmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height:300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading)
            {
                HStack {
                Text(landmark.name)
                        .font(.title)
                    
                    Spacer()
                    
                    FavouriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding(.horizontal, 14)
   
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return landmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
