//
//  Products.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import Foundation
// MARK: - Products
class Products: Codable {
    let products: [Product]
    let total, skip, limit: Int

    init(products: [Product], total: Int, skip: Int, limit: Int) {
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

// MARK: - Product
class Product: Codable {
    let id: Int
    let title, productDescription: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }

    init(id: Int, title: String, productDescription: String, price: Int, discountPercentage: Double, rating: Double, stock: Int, brand: String, category: String, thumbnail: String, images: [String]) {
        self.id = id
        self.title = title
        self.productDescription = productDescription
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}
