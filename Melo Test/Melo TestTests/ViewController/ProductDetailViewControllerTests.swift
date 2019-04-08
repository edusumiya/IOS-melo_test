//
//  ProductDetailViewController.swift
//  Melo TestTests
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Quick
import Nimble
@testable import Melo_Test

class ProductDetailViewControllerTests: QuickSpec {
    override func spec() {
        describe("ProductDetailViewController Tests") {
            let product = MockParser.getProduct()
            let viewController = StoryboardUtils.getProductDetailVC(product: product)
            
            beforeEach {
                viewController.view
            }
            
            context("View Controller Instance") {
                it("View Controller mut be a ProductDetailViewController type") {
                    expect(viewController).to(beAnInstanceOf(ProductDetailViewController.self))
                }
            }
            
            context("View Controller properties") {
                it("productTitleLabel must have correct product title") {
                    expect(viewController.productTitleLabel.text).to(contain("Google Chromecast 2 Hdmi Edição 2018 Original 1080p + Nf"))
                }
                
                it("productTitleLabel must have correct product condition") {
                    expect(viewController.productConditionLabel.text).to(contain("Produto Novo"))
                }
            }
            
            context("View Controller Methods") {
                it("View Controller should return correct number of images url") {
                    let imagesUrl = viewController.getPicturesPath(pictures: (product?.pictures)!)
                    expect(imagesUrl.count).to(beIdenticalTo(2))
                }
            }
        }
    }
}
