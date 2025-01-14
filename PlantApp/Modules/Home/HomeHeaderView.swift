//
//  HomeHeaderView.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct HomeHeaderView: View {
    @State private var searchText: String = ""

    var body: some View {
        ZStack {
            Image(Constants.Images.homeHeader)
                .resizable()

            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 50)
                Text(AppString.hiPlant)
                    .font(.customFont(.rubikRegular, size: 16))
                    .foregroundStyle(Constants.Colors.deepGreen)
                Text(AppString.goodAfternoon)
                    .font(.customFont(.rubikMedium, size: 24))
                    .foregroundStyle(Constants.Colors.deepGreen)
                HStack {
                    Image(Constants.Images.search)
                        .renderingMode(.original)
                        .font(.customFont(.rubikRegular, size: 16))
                    TextField(AppString.search, text: $searchText)
                        .disabled(true)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Constants.Colors.slateGray, lineWidth: 0.2)
                )
            }
            .padding(.all, 24)
            }
        }
}

#Preview {
    HomeHeaderView()
}