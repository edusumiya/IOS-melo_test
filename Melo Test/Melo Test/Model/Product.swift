//
//  Product.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 05/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: String?
    let title: String?
    let price: Double?
    let availableQuantity: Int?
    let soldQuantity: Int?
    let condition: String?
    let pictures: [Picture]?
    let thumbnail: String?
    let sellerAddress: SellerAddress?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition
        case pictures
        case thumbnail
        case sellerAddress = "seller_address"
    }
}

struct Picture: Codable {
    let id: String?
    let url: String?
    let secureURL: String?
    let size: String?
    let maxSize: String?
    let quality: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

struct SellerAddress: Codable {
    let city: City?
    let state: City?
    let country: City?

    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
    }
}

struct City: Codable {
    let id: String?
    let name: String?
}
