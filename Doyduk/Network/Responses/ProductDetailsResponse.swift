//
//  ProductDetailsResponse.swift
//  Doyduk
//
//  Created by yunus oktay on 19.03.2022.
//

import Foundation

struct ProductDetailsResponse: Decodable {
    
    let status: String
    let statusCode: Int
    let result: Product
    let message: String
}
