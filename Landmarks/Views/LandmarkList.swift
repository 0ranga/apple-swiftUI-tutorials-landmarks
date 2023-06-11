//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Heesham on 2/18/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (landmark.isFavorite || !showFavoritesOnly)
        }
    }
    
    var body: some View {
        
        NavigationView {
            // List(landmarks, id: \.id) { landmark in
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
            }
            .navigationTitle("Landmarks")
        }
        

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone Xs Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
