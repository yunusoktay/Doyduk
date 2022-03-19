//
//  Service.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import Foundation

struct Service {
    
    func getCategories(completion: @escaping (_ categoriesResponse: CategoriesResponse) -> Void) {
        
        let urlString = "http://159.223.0.153/categories"
        let url = URL(string: urlString)!
        
        let request = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { data, response, error in
            
            let decoder = JSONDecoder()
            let categoriesResponse = try! decoder.decode(CategoriesResponse.self, from: data!)
            completion(categoriesResponse)
            
        }.resume()
    }
    
}
