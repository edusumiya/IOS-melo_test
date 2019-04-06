//
//  ViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet var tableViewProducts: UITableView!
    
    var searchKeyword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureData()
    }
    
    fileprivate func configureUI() {
        
    }
    
    fileprivate func configureData() {
        if let searchText = searchKeyword {
            ProductService.fetchProducts(searchText: searchText, success: { (searchResults) in
                if let products = searchResults.results {
                    let productsDatasource = ProductsListDatasourceAndDelegates(tableViewProducts: self.tableViewProducts, productResults: products)
                    self.tableViewProducts.dataSource = productsDatasource
                    self.tableViewProducts.delegate = productsDatasource
                    self.tableViewProducts.reloadData()
                }
            }) { (error) in
                print(error)
            }
        }
    }
}

extension ProductListViewController: ProductListProtocol {
    func openProductDetail(product: Product) {
        ProductService.getProductDetail(productId: product.id ?? "", success: { (product) in
            print(product)
        }, failure: { (error) in
            print(error)
        })
    }
}

