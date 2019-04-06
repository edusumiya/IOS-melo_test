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
    
    func configureTable() {
        self.tableViewProducts.dataSource = self
        self.tableViewProducts.delegate = self
        self.tableViewProducts.reloadData()
        
        self.tableViewProducts.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }
    
    // MARK: - UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureData(productItem: productResults[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.openProductDetail(product: productResults[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
