//
//  ApiCaller.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import Foundation

struct Constants {
    static let base_URL = "https://dummyjson.com/products"
}


class APICaller {
    static let share = APICaller()
    
    
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: Constants.base_URL) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error  in
            if let error = error{
                completion(.failure(error))
            }
            else if data == data{
                do{
                    let results = try JSONDecoder().decode(Products.self, from: data!)
                    completion(.success(results.products))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
