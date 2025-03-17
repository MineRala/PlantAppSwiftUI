//
//  Constants.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct Constants {

    // MARK: - Color

    struct Colors {
        static let deepGreen = Color(hex: "#13231B")
        static let deepGreenSecondary = deepGreen.opacity(0.7)
        static let freshGreen = Color(hex: "#28AF6E")
        static let white = Color(hex: "#FFFFFF")
        static let lowOpacityWhite = white.opacity(0.05)
        static let whiteWithOpacity10 = white.opacity(0.1)
        static let middleLowOpacityWhite = white.opacity(0.3)
        static let middleTransparentWhite = white.opacity(0.52)
        static let lowTransparentWhite = white.opacity(0.5)
        static let transparentWhite = white.opacity(0.7)
        static let highTransparentWhite = white.opacity(0.92)
        static let mutedOlive = Color(hex: "#597165")
        static let mutedOliveSecondary = mutedOlive.opacity(0.7)
        static let transparentBlack = Color(hex: "#000000").opacity(0.24)
        static let paywallBackground = Color(hex: "#101E17")
        static let gradient1 = Color(hex: "#28AF6E").opacity(0.168)
        static let gradient2 = Color(hex: "28AF6E")
        static let softBlush = Color(hex: "#FBFAFA")
        static let slateGray = Color(hex: "#3C3C43").opacity(0.25)
        static let divider = Color(hex: "#13231B").opacity(0.1)
        static let tabItemText = Color(hex: "#979798")
        static let tabItemIcon = Color(hex: "#BDBDBD")
        static let mindGreen = Color(hex: "#29BB89").opacity(0.18)
        static let iceGray = Color(hex: "#F4F6F6")
    }

    // MARK: - Image
    
    struct Images {
        static let background = "background"
        static let getStarted = "getStarted"
        static let paywallBackground = "paywallBackground"
        static let onboardingBackground = "onboardingBackground"
        static let onBoardScreen1 = "onboarding1"
        static let onBoardScreen2 = "onboarding2"
        static let artwork = "artwork"
        static let brush = "brush"
        static let featureCardBackground = "featureCardBackground"
        static let faster = "faster"
        static let scanner = "scanner"
        static let badge = "badge"
        static let search = "search"
        static let select = "select"
        static let unselect = "unselect"
        static let close = "close"
        static let homeHeader = "homeHeader"
        static let premiumAvailableBackground = "premiumAvailableBackground"
        static let message = "message"
        static let maskGroup = "maskGroup"
        static let arrow = "arrow"
        static let home = "home"
        static let diagnose = "diagnose"
        static let scan = "scan"
        static let myGarden = "myGarden"
        static let profile = "profile"
        static let rotate = "rotate"
        static let overlay = "overlay"
    }

    // MARK: - Padding

    struct Padding {
        static let padding0: CGFloat = 0
        static let padding4: CGFloat = 4
        static let padding6: CGFloat = 6
        static let padding8: CGFloat = 8
        static let padding10: CGFloat = 10
        static let padding12: CGFloat = 12
        static let padding15: CGFloat = 15
        static let padding16: CGFloat = 16
        static let padding17: CGFloat = 17
        static let padding18: CGFloat = 18
        static let padding24: CGFloat = 24
        static let padding20: CGFloat = 20
        static let padding32: CGFloat = 32
        static let padding40: CGFloat = 40
        static let padding50: CGFloat = 50
        static let padding64: CGFloat = 64
    }
}
