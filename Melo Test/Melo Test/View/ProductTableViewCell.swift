//
//  File.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 06/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
import ImageLoader

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var productLocation: UILabel!
    @IBOutlet var productPrice: UILabel!
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    func configureData(productItem: Product) {
        productTitle.text = productItem.title
        
        if let urlThumb = URL(string: productItem.thumbnail ?? "") {
            productImage.load.request(with: urlThumb)
        }
        
        productPrice.text = "R$ \(String(format: "%.2f", productItem.price ?? "0"))"
        productLocation.text = "\(productItem.soldQuantity ?? 0) vendidos - \(productItem.sellerAddress?.state?.name ?? "")"
    }
}
