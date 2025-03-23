//
//  CustomTextStyle.swift
//  PlantApp
//
//  Created by Mine Rala on 20.03.2025.
//

import SwiftUICore

struct CustomTextStyle {
    // Rubik Font - Light
    static let tinyCaption = Font.customFont(.rubikLight, size: 9)
    static let caption = Font.customFont(.rubikLight, size: 12)
    static let mediumCaption = Font.customFont(.rubikLight, size: 17)
    static let largeCaption = Font.customFont(.rubikLight, size: 27)

    // Rubik Font - Regular
    static let micro = Font.customFont(.rubikRegular, size: 10)
    static let tiny = Font.customFont(.rubikRegular, size: 11)
    static let small = Font.customFont(.rubikRegular, size: 12)
    static let standart = Font.customFont(.rubikRegular, size: 13)
    static let body = Font.customFont(.rubikRegular, size: 16)
    static let bodySmall = Font.customFont(.rubikRegular, size: 15)
    static let titleLarge = Font.customFont(.rubikRegular, size: 28)

    // Rubik Font - Medium
    static let headline = Font.customFont(.rubikMedium, size: 20)
    static let mediumBody = Font.customFont(.rubikMedium, size: 15)
    static let contentBody = Font.customFont(.rubikMedium, size: 16)
    static let largeHeadline = Font.customFont(.rubikMedium, size: 24)
    static let superHeadline = Font.customFont(.rubikMedium, size: 28)

    // Rubik Font - Bold
    static let title = Font.customFont(.rubikBold, size: 24)
    static let titleLargeBold = Font.customFont(.rubikBold, size: 28)
    static let extraBoldTitle = Font.customFont(.rubikExtraBold, size: 28)

    // Rubik Font - Extra Bold
    static let headlineExtraBold = Font.customFont(.rubikExtraBold, size: 28)

    // Visby Font
    static let hugeTitle = Font.customFont(.visbyExtraBold, size: 30)

    // SFP Font
    static let sfpBodyBold = Font.customFont(.sfpBold, size: 15)
}
