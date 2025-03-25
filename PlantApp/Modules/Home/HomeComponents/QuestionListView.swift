//
//  QuestionListView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct QuestionListView: View {
    let questions: [QuestionModel]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(questions) { question in
                    QuestionCardView(model: question)
                }
            }
            .padding(.horizontal, Constants.Padding.padding24)
        }
    }
}

#Preview {
    QuestionListView(questions: [
        QuestionModel(id: 1, title: "How to identify plants?", subtitle: "Life Style", image: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard.png?alt=media", uri: "https://plantapp.app/blog/identifying-plant-in-10-steps/", order: 1),
        QuestionModel(id: 2, title: "Differences Between Species and Varieties?", subtitle: "Plant Identify", image: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2Fcard2.png?alt=media", uri: "https://plantapp.app/blog/differences-between-species-and-varieties/", order: 2),
        QuestionModel(id: 3, title: "The reasons why the same plant can look different?", subtitle: "Life Style", image: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard3.png?alt=media", uri: "https://plantapp.app/blog/same-seeds-but-different-looking-plants/", order: 3)
    ])
}


// MARK: - QuestionCardView
struct QuestionCardView: View {
    let model: QuestionModel
    @State private var isImageLoaded = false

    var body: some View {
        ZStack(alignment: .bottom) {
            CustomAsyncImage(
                urlString: model.image,
                width: 240,
                height: 164,
                contentMode: .fill,
                isImageLoaded: $isImageLoaded
            )

            if isImageLoaded {
                Text(model.title ?? AppString.emptyString.localized)
                    .font(CustomTextStyle.bodySmall)
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

#Preview {
    QuestionCardView(model: QuestionModel(id: 1,
                                          title: "How to identify plants?",
                                          subtitle: "Life Style",
                                          image: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard.png?alt=media",
                                          uri: "https://plantapp.app/blog/identifying-plant-in-10-steps/",
                                          order: 1)
    )

}
