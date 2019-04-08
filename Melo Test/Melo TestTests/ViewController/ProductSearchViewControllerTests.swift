//
//  ProductSearchViewControllerTests.swift
//  Melo TestTests
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Quick
import Nimble
@testable import Melo_Test

class ProductSearchViewControllerTests: QuickSpec {
    override func spec() {
        describe("ProductSeachViewController Tests") {
            let viewController = StoryboardUtils.getProductSearchVC()
            
            beforeEach {
                viewController.view
            }
            context("View Controller Instance") {
                it("View Controller mut be a ProductSearchViewController type") {
                    expect(viewController).to(beAnInstanceOf(ProductSearchViewController.self))
                }
                
                it("View Controller search instance") {
                    expect(viewController.searchViewProducts).notTo(be(nil))
                }
            }
            
            context("Search Field Delegate") {
                beforeEach {
                    viewController.searchViewProducts.text = "Chromecast"
                    viewController.searchBar(viewController.searchViewProducts, textDidChange: "Chromecast")
                }
                it("Search Field must fill your field with desired word") {
                    expect(viewController.searchViewProducts.text).to(beIdenticalTo("Chromecast"))
                }
                it("Search Button must be released with search field") {
                    expect(viewController.searchButton.isEnabled).to(beIdenticalTo(true))
                }
            }
        }
    }
}
