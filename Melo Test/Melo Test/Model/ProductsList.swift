//
//  ItemModel.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation

struct ProductsList: Codable {
    let siteID: String?
    let query: String?
    let paging: Paging?
    let results: [Product]?
    let sort: Sort?
    let filters: [Filter]?
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query
        case paging
        case results
        case sort
        case filters
    }
}

struct Sort: Codable {
    let id: String?
    let name: String?
}

struct Filter: Codable {
    let id: String?
    let name: String?
    let type: String?
    let values: [FilterValue]?
}

struct FilterValue: Codable {
    let id: String?
    let name: String?
    let pathFromRoot: [Sort]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pathFromRoot = "path_from_root"
    }
}

struct Paging: Codable {
    let total: Int?
    let offset: Int?
    let limit: Int?
    let primaryResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case total
        case offset
        case limit
        case primaryResults = "primary_results"
    }
}
