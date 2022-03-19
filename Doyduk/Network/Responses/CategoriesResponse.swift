//
//  CategoriesResponse.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import Foundation

struct CategoriesResponse: Decodable {
    
    let status: String
    let statusCode: Int
    let result: [Category]
    let message: String
}

