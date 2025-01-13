//
//  QuestionModel.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

typealias QuestionModels = [QuestionModel]

struct QuestionModel: Decodable, Identifiable {
    let id: Int?
    let title: String?
    let subtitle: String?
    let image: String?
    let uri: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
           case id, title, subtitle, uri, order
           case image = "image_uri"
       }
}
