//
//  CategoryCardView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct CategoryCardView: View {
    let model: CategoryDataModel
    @State private var isImageLoaded = false

    var body: some View {
        ZStack {
            if let imageData = model.image,
               let imageURL = imageData.url,
               let imageUrl = URL(string: imageURL) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 158, height: 152)
                            .onAppear {
                                self.isImageLoaded = true
                            }
                    case .failure:
                        Text(AppString.imageNotLoad)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text(AppString.imageInvalid)
            }

            if isImageLoaded {
                HStack {
                    VStack {
                        Spacer()
                        Text(model.name?.capitalized ?? AppString.emptyString)
                            .font(.customFont(.rubikMedium, size: 16))
                            .foregroundStyle(Constants.Colors.deepGreen)
                            .frame(maxHeight: .infinity, alignment: .topLeading)
                    }
                    .padding(.leading, Constants.Padding.padding16)
                    .padding(.top, Constants.Padding.padding16)
                    Spacer()
                }
            }
        }
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Constants.Colors.mindGreen, lineWidth: 0.5)
        )
        .background(Constants.Colors.iceGray)
    }
}

//#Preview {
//    CategoryCardView(model: )
//}
