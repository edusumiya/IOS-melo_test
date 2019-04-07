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
    // MARK: - TypeAlias
    typealias SuccessProducts = (_ resultProducts: ProductsList) -> Void
    typealias SuccessProduct = (_ resultProduct: Product) -> Void
    typealias Failure = (_ error: Error) -> Void
    
    // MARK: - Service Methods
    static func fetchProducts(searchText: String, offset: Int, success: @escaping SuccessProducts, failure: @escaping Failure) {
        let url = getSearchQuery(siteId: "MLB", query: searchText, offset: offset)
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { response in
            if response.result.isSuccess {
                do {
                    let products = try JSONDecoder().decode(ProductsList.self, from: response.data ?? Data())
                    
                    success(products)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.error ?? NSError(domain: "Falha ao buscar produtos", code: 409, userInfo: nil))
            }
        }
    }
    
    static func getProductDetail(productId: String, success: @escaping SuccessProduct, failure: @escaping Failure) {
        let url = getProductDetailQuery(productId: productId)
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { response in
            if response.result.isSuccess {
                do {
                    let product = try JSONDecoder().decode(Product.self, from: response.data ?? Data())
                    
                    success(product)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.error ?? NSError(domain: "Falha ao buscar produto", code: 409, userInfo: nil))
            }
        }
    }
    
    // MARK: - Url Creation Methods
    fileprivate static func getSearchQuery(siteId: String, query: String, offset: Int) -> String {
        return Environment.HOST + Environment.sitePath + siteId + "/" + Environment.searchPath + query + Environment.offsetPath + "\(offset)"
    }
    
    fileprivate static func getProductDetailQuery(productId: String) -> String {
        return Environment.HOST + Environment.itemDetail + productId
    }
}
