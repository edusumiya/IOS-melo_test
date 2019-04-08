//
//  StoryboardUtils.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 06/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit

class StoryboardUtils: NSObject {
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func getProductSearchVC() -> ProductSearchViewController {
        guard let productSearchVC = storyboard.instantiateViewController(withIdentifier: "ProductSearch") as? ProductSearchViewController else {
            return ProductSearchViewController()
        }

        return productSearchVC
    }
    
    static func getProductListVC(searchKeyword: String?) -> ProductListViewController {
        guard let productListVC = storyboard.instantiateViewController(withIdentifier: "ProductList") as? ProductListViewController else {
            return ProductListViewController()
        }
        
        productListVC.searchKeyword = searchKeyword
        return productListVC
    }
    
    static func getProductDetailVC(product: Product?) -> ProductDetailViewController {
        guard let productdetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetail") as? ProductDetailViewController else {
            return ProductDetailViewController()
        }
        
        productdetailVC.productDetail = product
        return productdetailVC
    }
    
    static func getErrorVC() -> ErrorServiceViewController {
        guard let errorVC = storyboard.instantiateViewController(withIdentifier: "ProductError") as? ErrorServiceViewController else {
            return ErrorServiceViewController()
        }
        
        return errorVC
    }
}
