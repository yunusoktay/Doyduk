//
//  Category.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import Foundation

struct Category: Decodable {
    
    let id: Int
    let name: String
    let prefix: String
    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case prefix
        case imageUrl = "img_url"
    }
}
