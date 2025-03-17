//
//  OverlayImageView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct OverlayImageView: View {
    let imageName: String?

    var body: some View {
        if let imageName = imageName {
            VStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width, height: 235)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .zIndex(0)
            }
        }
    }
}
