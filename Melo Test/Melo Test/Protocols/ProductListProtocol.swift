//
//  ProductListProtocol.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 05/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation

protocol ProductListProtocol {
    /// Returns the selected product from Products List
    ///
    /// - Parameter product: product selected
    func openProductDetail(product: Product)
}
