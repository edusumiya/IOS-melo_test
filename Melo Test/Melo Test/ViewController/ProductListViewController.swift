//
//  ViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import UIKit

class ProductListViewController: BaseViewController, ProductListProtocol, ErrorServiceProtocol {
    
    // MARK: - Properties
    
    @IBOutlet var tableViewProducts: UITableView!
    @IBOutlet var pagingLabel: UILabel!
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var searchKeyword: String?
    var offset: Int = 0
    var limit: Int = 0
    var totalResults: Int = 0
    var productsDatasource: ProductsListDatasourceAndDelegates!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        dataRequest(dataOffset: 0)
    }
    
    fileprivate func configureUI() {
        self.navigationItem.title = searchKeyword == nil ? "Produtos" : searchKeyword
    }
    
    fileprivate func dataRequest(dataOffset: Int) {
        showProgressHUD()
        if let searchText = searchKeyword {
            ProductService.fetchProducts(searchText: searchText, offset: dataOffset, success: { (searchResults) in
                if let products = searchResults.results {
                    if self.productsDatasource == nil {
                        self.productsDatasource = ProductsListDatasourceAndDelegates(tableViewProducts: self.tableViewProducts, productResults: products)
                        
                        self.productsDatasource.delegate = self
                        self.productsDatasource.configureTable()
                        
                        self.tableViewProducts.reloadData()
                    } else {
                        self.productsDatasource.productResults = products
                        
                        self.tableViewProducts.reloadData()
                        
                        let indexPath = IndexPath(row: 0, section: 0)
                        self.tableViewProducts.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                    
                    self.pagingLabel.text = "\(self.offset) de \(searchResults.paging?.primaryResults ?? 0)"
                    self.configureButtons()
                    
                    if let searchTotal = searchResults.paging?.total, let primaryResults = searchResults.paging?.primaryResults {
                        if searchTotal >= primaryResults {
                            self.totalResults = primaryResults
                        }
                    }
                    
                    self.limit = searchResults.paging?.limit ?? 0
                    self.hideProgressHUD()
                }
            }) { (error) in
                self.hideProgressHUD()
                let errorVC = StoryboardUtils.getErrorVC()
                errorVC.delegate = self
                self.present(errorVC, animated: true, completion: nil)
            }
        }
    }
    
    func configureButtons() {
        if offset == 0 {
            previousButton.isEnabled = false
            nextButton.isEnabled = true
        } else if self.offset >= (totalResults - limit) {
            previousButton.isEnabled = true
            nextButton.isEnabled = false
        } else {
            previousButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    // MARK: - Actions
    @IBAction func previousClick(_ sender: Any) {
        offset -= limit
        dataRequest(dataOffset: offset)
    }
    
    @IBAction func nextClick(_ sender: Any) {
        offset += limit
        dataRequest(dataOffset: offset)
    }
    
    // MARK: - ProductListProtocol
    func openProductDetail(product: Product) {
        showProgressHUD()
        ProductService.getProductDetail(productId: product.id ?? "", success: { (product) in
            self.hideProgressHUD()
            let productDetailVC = StoryboardUtils.getProductDetailVC(product: product)
            self.navigationController?.pushViewController(productDetailVC, animated: true)
        }, failure: { (error) in
            self.displayErrorMessage(message: error.localizedDescription)
        })
    }
    
    // MARK: - ErrorServiceProtocol
    func tryAgain() {
        dataRequest(dataOffset: offset)
    }
}
