//
//  Font+Ext.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

public enum CustomFont: String {
    case rubikBlack = "Rubik-Black"
    case rubikBlackItalic = "Rubik-BlackItalic"
    case rubikBold = "Rubik-Bold"
    case rubikBoldItalic = "Rubik-BoldItalic"
    case rubikExtraBold = "Rubik-ExtraBold"
    case rubikExtraBoldItalic = "Rubik-ExtraBoldItalic"
    case rubikItalic = "Rubik-Italic"
    case rubikLight = "Rubik-Light"
    case rubikLightItalic = "Rubik-LightItalic"
    case rubikMedium = "Rubik-Medium"
    case rubikMediumItalic = "Rubik-MediumItalic"
    case rubikRegular = "Rubik-Regular"
    case rubikSemiBold = "Rubik-SemiBold"
    case rubikSemiBoldItalic = "Rubik-SemiBoldItalic"
    case sfpBold = "SFProText-Bold"
    case sfpBoldItalic = "SFProText-BoldItalic"
    case sfpHeavy = "SFProText-Heavy"
    case sfpHeavyItalic = "SFProText-HeavyItalic"
    case sfpLight = "SFProText-Light"
    case sfpLightItalic = "SFProText-LightItalic"
    case sfpMedium = "SFProText-Medium"
    case sfpMediumItalic = "SFProText-MediumItalic"
    case sfpRegular = "SFProText-Regular"
    case sfpRegularItalic = "SFProText-RegularItalic"
    case sfpSemibold = "SFProText-Semibold"
    case sfpSemiboldItalic = "SFProText-SemiboldItalic"
    case visbyExtraBold = "VisbyExtrabold"
}

extension Font {
    static func customFont(_ name: CustomFont, size: CGFloat) -> Font {
        return .custom(name.rawValue, size: size)
    }
}
