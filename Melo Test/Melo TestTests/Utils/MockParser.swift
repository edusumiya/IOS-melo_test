//
//  MockParser.swift
//  Melo TestTests
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
@testable import Melo_Test

class MockParser: NSObject {
    static func getProduct() -> Product? {
        if let jsonFile = Bundle.main.path(forResource: "ProductMock", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: jsonFile) {
                let product = try? JSONDecoder().decode(Product.self, from: jsonData as Data)
                
                return product
            }
        }
        
        return nil
    }
    
    static func getProductsSearch() -> ProductsList? {
        if let jsonFile = Bundle.main.path(forResource: "ProductsSearchList", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: jsonFile) {
                let productList = try? JSONDecoder().decode(ProductsList.self, from: jsonData as Data)
                
                return productList
            }
        }
        
        return nil
    }
}
