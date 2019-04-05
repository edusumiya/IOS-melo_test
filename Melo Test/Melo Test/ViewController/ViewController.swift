//
//  ViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 04/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ProductService.fetchProducts(searchText: "chromecast", success: { (products) in
            print(products)
            ProductService.getProductDetail(productId: products.results?.first?.id ?? "", success: { (product) in
                print(product)
            }, failure: { (error) in
                print(error)
            })
        }) { (error) in
            print(error)
        }
    }


}

