//
//  ProductService.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import Alamofire
class ProductService: NSObject {
    static func getProducts(searchText: String, success:(_ result: Bool)->(), failure:(_ error: Error)->()) {
        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
    }
}
