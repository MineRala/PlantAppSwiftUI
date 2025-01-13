//
//  CategoryModel.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

struct CategoryModel: Decodable {
    let data: [CategoryDataModel?]
}

struct CategoryDataModel: Decodable, Identifiable{
    let id: Int?
    let name: String?
    let image: CategoryImageModel?
}

struct CategoryImageModel: Decodable {
    let id: Int?
    let url: String?
}
