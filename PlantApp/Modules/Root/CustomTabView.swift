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
            // Divider line
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Constants.Colors.divider)
                .frame(maxWidth: .infinity)

            HStack {
                // Dynamically generate tab bar items
                ForEach(TabBarItem.allCases, id: \.self) { item in
                    if item == .scan {
                        // Special button for the "scan" tab
                        Button {
                            self.index = 2
                        } label: {
                            Image(Constants.Images.scan)
                                .offset(y: -30)
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        // General tab bar items
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
            .padding(.horizontal, 10)
            .background(Constants.Colors.highTransparentWhite)
        }
    }

}

#Preview {
    CustomTabView(index: .constant(0))
}


