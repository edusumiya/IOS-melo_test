//
//  CarouselImageView.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
import ImageLoader

class CarouselImageView: UIView {
    // MARK: - Properties
    @IBOutlet var productImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    // MARK: - Methods
    class func loadFromNib() -> CarouselImageView? {
        return self.loadFromNib(withName: "CarouselImageView")
    }
    
    func setData(imageUrl: URL) {
        productImageView.load.request(with: imageUrl)
    }
}
