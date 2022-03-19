//
//  ProductsResponse.swift
//  Doyduk
//
//  Created by yunus oktay on 19.03.2022.
//

import Foundation
import SwiftUI

struct ProductsResponse: Decodable {
    
    let status: String
    let statusCode: Int
    let result: [Product]
    let message: String
}

struct Product: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let categoryId: Int
    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case categoryId = "category_id"
        case imageUrl = "image_url"
    }
}
