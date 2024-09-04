//
//  landmarkList.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI

struct landmarkList: View {
    var body: some View {
        NavigationSplitView {
            
            List(landmarks) { landmark in
                NavigationLink{
                    landmarkDetail(landmark: landmark)
                }label:{
                    landmarkRowItem(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
                Text("Select a Landmark")
            }
        }
    
}

#Preview {
    landmarkList()
}
