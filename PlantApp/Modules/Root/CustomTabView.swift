//
//  TabView.swift
//  PlantApp
//
//  Created by Mine Rala on 23.12.2024.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var index: Int

    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Constants.Colors.divider)
                .frame(maxWidth: .infinity)

            HStack {
                ForEach(TabBarItem.allCases, id: \.self) { item in
                    if item == .scan {
                        Button {
                            self.index = 2
                        } label: {
                            Image(Constants.Images.scan)
                                .offset(y: -30)
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        TabBarItemView(
                            imageName: item.imageName,
                            title: item.title,
                            isSelected: index == item.rawValue
                        ) {
                            self.index = item.rawValue
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, Constants.Padding.padding10)
            .background(Constants.Colors.highTransparentWhite)
        }
    }

}

#Preview {
    CustomTabView(index: .constant(0))
}
