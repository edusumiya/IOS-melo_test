//
//  ViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet var tableViewProducts: UITableView!
    @IBOutlet var pagingLabel: UILabel!
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var searchKeyword: String?
    var offset: Int = 0
    var limit: Int = 0
    var totalResults: Int = 0
    fileprivate var productsDatasource: ProductsListDatasourceAndDelegates!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureData(dataOffset: 0)
    }
    
    fileprivate func configureUI() {
        self.navigationItem.title = searchKeyword == nil ? "Produtos" : "Pesquisa por \(searchKeyword ?? "")"
    }
    
    fileprivate func configureData(dataOffset: Int) {
        if let searchText = searchKeyword {
            ProductService.fetchProducts(searchText: searchText, offset: dataOffset, success: { (searchResults) in
                if let products = searchResults.results {
                    self.productsDatasource = ProductsListDatasourceAndDelegates(tableViewProducts: self.tableViewProducts, productResults: products)
                    self.productsDatasource.delegate = self
                    self.productsDatasource.configureTable()
                    
                    self.pagingLabel.text = "\(self.offset) itens de \(searchResults.paging?.primaryResults ?? 0)"
                    
                    if self.offset == 0 {
                        self.previousButton.isEnabled = false
                        self.nextButton.isEnabled = true
                    } else if self.offset >= (self.totalResults) {
                        self.previousButton.isEnabled = true
                        self.nextButton.isEnabled = false
                    } else {
                        self.previousButton.isEnabled = true
                        self.nextButton.isEnabled = true
                    }
                    
                    if let searchTotal = searchResults.paging?.total, let primaryResults = searchResults.paging?.primaryResults {
                        if searchTotal >= primaryResults {
                            self.totalResults = primaryResults
                        }
                    }
                    
                    self.limit = searchResults.paging?.limit ?? 0
                }
            }) { (error) in
                print(error)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func previousClick(_ sender: Any) {
        offset -= limit
        configureData(dataOffset: offset)
    }
    
    @IBAction func nextClick(_ sender: Any) {
        offset += limit
        configureData(dataOffset: offset)
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

