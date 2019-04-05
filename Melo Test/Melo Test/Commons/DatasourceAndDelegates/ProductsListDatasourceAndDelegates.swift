//
//  ProductsListDatasourceAndDelegates.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 05/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
class ProductsListDatasourceAndDelegates: NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Variables
    var tableViewProducts: UITableView
    var productResults: [Product]
    
    // MARK: - Delegate
    var delegate: ProductListProtocol?
    
    // MARK: - Constructor
    init(tableViewProducts: UITableView, productResults: [Product]) {
        self.tableViewProducts = tableViewProducts
        self.productResults = productResults
    }
    
    // MARK: - UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.openProductDetail(product: productResults[indexPath.row])
    }
}
