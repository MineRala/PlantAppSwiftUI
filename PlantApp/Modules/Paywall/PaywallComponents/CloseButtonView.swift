//
//  CloseButtonView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct CloseButtonView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    viewModel.closeButtonTapped()
                }) {
                    Image(Constants.Images.close)
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing)
            }
            Spacer()
        }
    }
}

#Preview {
    CloseButtonView(viewModel: PaywallViewModel())
}
