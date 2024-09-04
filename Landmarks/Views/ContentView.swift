//
//  ContentView.swift
//  Landmarks
//
//  Created by Peter Abbott on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        landmarkList()
    }
    
}

#Preview {
    ContentView()
        .environment(ModelData())
}
