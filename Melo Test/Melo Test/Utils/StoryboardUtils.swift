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
    
    static func getProductListVC(searchKeyword: String?) -> ProductListViewController {
        guard let productListVC = storyboard.instantiateViewController(withIdentifier: "ProductList") as? ProductListViewController else {
            return ProductListViewController()
        }
        
        productListVC.searchKeyword = searchKeyword
        return productListVC
    }
}
