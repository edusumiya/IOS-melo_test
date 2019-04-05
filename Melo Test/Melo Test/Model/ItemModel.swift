//
//  ItemModel.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation

struct ItemModel: Codable {
    let title: String
    let categoryID: String
    let price: Int
    let currencyID: String
    let availableQuantity: Int
    let buyingMode: String
    let listingTypeID: String
    let condition: String
    let description: String
    let videoID: String
    let warranty: String
    let pictures: [Picture]
    
    enum CodingKeys: String, CodingKey {
        case title
        case categoryID = "category_id"
        case price
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case condition, description
        case videoID = "video_id"
        case warranty, pictures
    }
}

struct Picture: Codable {
    let source: String
}
