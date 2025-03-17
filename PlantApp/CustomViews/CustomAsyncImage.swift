//
//  CustomAsyncImage.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct CustomAsyncImage: View {
    let urlString: String?
    let width: CGFloat?
    let height: CGFloat?
    let contentMode: ContentMode
    @Binding var isImageLoaded: Bool


    var body: some View {
        ZStack {
            if let urlString = urlString, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                        //                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: contentMode)
                            .frame(width: width, height: height)
                            .clipped()
                            .onAppear {
                                self.isImageLoaded = true
                            }
                    case .failure:
                        Text(AppString.imageNotLoad)
                            .foregroundStyle(.gray)
                            .font(.caption)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text(AppString.imageInvalid)
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    CustomAsyncImage(
        urlString: "https://plantapp.app/blog/identifying-plant-in-10-steps/",
        width: 150,
        height: 150,
        contentMode: .fill,
        isImageLoaded: .constant(false)
    )
}
