//
//  PremiumAvailableView.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct PremiumAvailableView: View {
    var body: some View {
        ZStack {
            Image(Constants.Images.premiumAvailableBackground)
                .resizable()
            HStack {
                Image(Constants.Images.message)
                    .renderingMode(.original)
                    .frame(width: 36, height: 30)
                Image(Constants.Images.maskGroup)
                    .renderingMode(.original)
                Image(Constants.Images.arrow)
                    .renderingMode(.original)
            }
            .cornerRadius(12)
        }
    }
}

#Preview {
    PremiumAvailableView()
}
