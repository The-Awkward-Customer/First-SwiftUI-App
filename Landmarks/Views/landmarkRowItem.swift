//
//  landmarkRow.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI

struct landmarkRowItem: View {
    var landmark: Landmark
    
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

#Preview {
    Group{
        landmarkRowItem(landmark: landmarks[0])
        landmarkRowItem(landmark: landmarks[1])
    }
}

