//
//  ProductSearchViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 06/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit

class ProductSearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet var searchViewProducts: UISearchBar!
    @IBOutlet var searchButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        configureUI()
        configureData()
    }
    
    // MARK: - Methods
    fileprivate func configureUI() {
        let searchTextField: UITextField? = searchViewProducts.value(forKey: "searchField") as? UITextField
        
        if searchTextField!.responds(to: #selector(getter: UITextField.attributedPlaceholder)) {
            let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.white]
            searchTextField!.attributedPlaceholder = NSAttributedString(string: "Digite o nome do produto", attributes: attributeDict)
        }
        
        searchButton.isEnabled = false
        searchButton.alpha = 0.2
    }
    
    func configureData() {
        searchViewProducts.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func searchClicked(_ sender: Any) {
        let productListVC = StoryboardUtils.getProductListVC(searchKeyword: searchViewProducts.text)
        self.navigationController?.pushViewController(productListVC, animated: true)
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            searchButton.isEnabled = true
            searchButton.alpha = 1
        } else {
            searchButton.isEnabled = false
            searchButton.alpha = 0.2
        }
    }
}
