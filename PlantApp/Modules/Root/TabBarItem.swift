//
//  TabBarItem.swift
//  PlantApp
//
//  Created by Mine Rala on 24.12.2024.
//

import Foundation

enum TabBarItem: Int, CaseIterable {
    case home = 0
    case diagnose = 1
    case scan = 2
    case myGarden = 3
    case profile = 4

    var imageName: String {
        switch self {
        case .home: return Constants.Images.home
        case .diagnose: return Constants.Images.diagnose
        case .scan: return Constants.Images.scan
        case .myGarden: return Constants.Images.myGarden
        case .profile: return Constants.Images.profile
        }
    }

    var title: String {
        switch self {
        case .home: return AppString.home.localized
        case .diagnose: return AppString.diagnose.localized
        case .scan: return AppString.emptyString.localized
        case .myGarden: return AppString.myGarden.localized
        case .profile: return AppString.profile.localized
        }
    }
}
