//
//  CategoryGridView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct CategoryGridView: View {
    let categories: [CategoryDataModel]
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(categories) { category in
                    CategoryCardView(model: category)
                }
            }
            .padding(.horizontal, Constants.Padding.padding24)
        }
        .padding(.top)
        .padding(.bottom)
    }
}

#Preview {
    CategoryGridView(categories: [
        CategoryDataModel(
            id: 1,
            name: "Plants",
            image: CategoryImageModel(id: 1, url: "https://via.placeholder.com/150")
        ),
        CategoryDataModel(
            id: 2,
            name: "Flowers",
            image: CategoryImageModel(id: 2, url: "https://via.placeholder.com/150")
        ),
        CategoryDataModel(
            id: 3,
            name: "Trees",
            image: CategoryImageModel(id: 3, url: "https://via.placeholder.com/150")
        )
    ])
}


// MARK: - CategoryCardView
struct CategoryCardView: View {
    let model: CategoryDataModel
    @State private var isImageLoaded = false

    var body: some View {
        ZStack {
            CustomAsyncImage(
                urlString: model.image?.url,
                width: 158,
                height: 152,
                contentMode: .fill,
                isImageLoaded: $isImageLoaded
            )
            if isImageLoaded {
                HStack {
                    VStack {
                        Spacer()
                        Text(model.name?.capitalized ?? AppString.emptyString)
                            .font(CustomTextStyle.contentBody)
                            .lineSpacing(5)
                            .kerning(-0.32)
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

#Preview {
    CategoryCardView(
        model: CategoryDataModel(
            id: 1,
            name: "fern",
            image: CategoryImageModel(id: 23, url: "https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png")
        )
    )
}
