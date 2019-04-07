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
    // MARK: - Properties
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productLocation: UILabel!
    @IBOutlet var productPrice: UILabel!
    
    // MARK: - Constants
    static let cellIdentifier = "ProductCell"
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    // MARK: - Methods
    func configureData(productItem: Product) {
        productTitle.text = productItem.title
        
        if let urlThumb = URL(string: productItem.thumbnail ?? "") {
            productImage.load.request(with: urlThumb)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        productPrice.text = formatter.string(from: NSNumber(value: productItem.price ?? 0))
        productLocation.text = "\(productItem.soldQuantity ?? 0) vendidos \n\(productItem.sellerAddress?.state?.name ?? "")"
    }
}
