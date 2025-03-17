//
//  RotatedImageView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct RotatedImageView: View {
    let imageName: String?

    var body: some View {
        if let imageName = imageName {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(.top, Constants.Padding.padding50)
                .blur(radius: 15)
                .rotationEffect(.degrees(73.6))
        }
    }
}
