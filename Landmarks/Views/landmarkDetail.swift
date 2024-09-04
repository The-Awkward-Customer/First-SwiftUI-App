//
//  landmarkDetail.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI

struct landmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height:300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading)
            {
                Text(landmark.name)
                        .font(.title)
                    .foregroundColor(.black)
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
    landmarkDetail(landmark: landmarks[0])
}
