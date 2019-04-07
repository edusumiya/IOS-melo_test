//
//  ProductDetailViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
import iCarousel
class ProductDetailViewController: BaseViewController, iCarouselDataSource {

    // MARK: - Properties
    @IBOutlet var productTitleLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productLocationLabel: UILabel!
    @IBOutlet var productConditionLabel: UILabel!
    @IBOutlet var productAvailabilityLabel: UILabel!
    @IBOutlet var carouselView: iCarousel!
    
    // MARK: - Model Object
    var productDetail: Product?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Methods
    fileprivate func configureUI() {
        if let product = productDetail {
            productTitleLabel.text = product.title
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "pt_BR")
            
            productPriceLabel.text = formatter.string(from: NSNumber(value: product.price ?? 0))
            productLocationLabel.text = "\(product.sellerAddress?.city?.name ?? "")/\n\(product.sellerAddress?.state?.name ?? "")"
            productConditionLabel.text = product.condition == "new" ? "Produto Novo" : "Produto Usado"
            productAvailabilityLabel.text = "\(product.availableQuantity ?? 0) em disponibilidade"

            carouselView.dataSource = self
            carouselView.isPagingEnabled = true
        }
    }
    
    func getPicturesPath(pictures: [Picture]) -> [String] {
        var picturesPath = [String]()
        
        for picture in pictures {
            if let picturePath = picture.url {
                picturesPath.append(picturePath)
            }
        }
        
        return picturesPath
    }
    
    // MARK: - iCarouselDataSource
    func numberOfItems(in carousel: iCarousel) -> Int {
        return productDetail?.pictures?.count ?? 0
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        guard let imageCarouselView = CarouselImageView.loadFromNib() else {
            return UIView()
        }
        
        if let productUrl = productDetail?.pictures?[index].url, let url = URL(string: productUrl) {
            imageCarouselView.setData(imageUrl: url)
            
        }
        
        return imageCarouselView
    }
}
