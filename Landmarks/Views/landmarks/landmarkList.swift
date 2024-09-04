//
//  landmarkList.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

import SwiftUI

struct landmarkList: View {
    
    @Environment(ModelData.self) var modelData
    
//    is a private var because it only effects this view
    @State private var showFavoritesOnly = false
    
//    takes the landmark data model and 
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in (!showFavoritesOnly || landmark.isFavorite)}
    }
    
    var body: some View {
        NavigationSplitView {
            
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favourites only")
                }
                
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        landmarkDetail(landmark: landmark)
                    }label:{
                        landmarkRowItem(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
                Text("Select a Landmark")
            }
        }
    
}

#Preview {
    landmarkList()
        .environment(ModelData())
}
