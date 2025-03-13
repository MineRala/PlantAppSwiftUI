//
//  QuestionCardView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct QuestionCardView: View {
    let model: QuestionModel
    @State private var isImageLoaded = false

    var body: some View {
        ZStack(alignment: .bottom) {
            if let imageUrlString = model.image,
               let imageUrl = URL(string: imageUrlString) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 164)
                            .clipped()
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
                Text(model.title ?? AppString.emptyString)
                    .font(.customFont(.rubikRegular, size: 15))
                    .lineSpacing(5)
                    .kerning(-0.24)
                    .foregroundStyle(Constants.Colors.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .frame(width: 240, alignment: .bottom)
            }

        }
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Constants.Colors.whiteWithOpacity10, lineWidth: 1)
        )
    }
}
