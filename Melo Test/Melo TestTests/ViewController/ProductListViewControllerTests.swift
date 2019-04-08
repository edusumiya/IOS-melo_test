//
//  ProductListViewControllerTests.swift
//  Melo TestTests
//
//  Created by Eduardo Sumiya on 08/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Quick
import Nimble
import OCHamcrest
import OCMockitoSwift

@testable import Melo_Test

class ProductListViewControllerTests: QuickSpec {
    override func spec() {
        describe("ProductListViewController Tests") {
            let products = MockParser.getProductsSearch()
            let viewController = StoryboardUtils.getProductListVC(searchKeyword: "Chromecast")

            context("View Controller Instance") {
                it("View Controller mut be a ProductListViewController type") {
                    expect(viewController).to(beAnInstanceOf(ProductListViewController.self))
                }
            }
            
            context("TableView tests") {
                beforeEach {
                    let window = UIWindow(frame: UIScreen.main.bounds)
                    window.makeKeyAndVisible()
                    window.rootViewController = viewController
                    
                    viewController.productsDatasource = ProductsListDatasourceAndDelegates(tableViewProducts: viewController.tableViewProducts, productResults: (products?.results)!)
                    viewController.productsDatasource.configureTable()
                    viewController.tableViewProducts.reloadData()
                }
                
                it("Table View must have same results that mock") {
                    expect(viewController.tableViewProducts.numberOfRows(inSection: 0)).to(beIdenticalTo(products?.results?.count))
                }
            }
            
            context("View Controller Methods") {
                beforeEach {
                    viewController.offset = 50
                    viewController.limit = 50
                }
                it("ofsset must be 0") {
                    viewController.previousClick(UIButton())
                    expect(viewController.offset).to(beIdenticalTo(0))
                }
                it("ofsset must be 100") {
                    viewController.nextClick(UIButton())
                    expect(viewController.offset).to(beIdenticalTo(100))
                }
            }
            
            context("View Controller Button Configuration") {
                it("Prev Button Must be Disabled and Next Enabled") {
                    viewController.offset = 0
                    viewController.totalResults = 10
                    viewController.configureButtons()
                    expect(viewController.previousButton.isEnabled).to(beIdenticalTo(false))
                    expect(viewController.nextButton.isEnabled).to(beIdenticalTo(true))
                }
                
                it("Prev Button Must be Enabled and Next Enabled") {
                    viewController.offset = 5
                    viewController.totalResults = 10
                    viewController.configureButtons()
                    expect(viewController.previousButton.isEnabled).to(beIdenticalTo(true))
                    expect(viewController.nextButton.isEnabled).to(beIdenticalTo(true))
                }
                
                it("Prev Button Must be Enabled and Next Disabled") {
                    viewController.offset = 10
                    viewController.totalResults = 10
                    viewController.configureButtons()
                    expect(viewController.previousButton.isEnabled).to(beIdenticalTo(true))
                    expect(viewController.nextButton.isEnabled).to(beIdenticalTo(false))
                }
            }
            
            context("View Controller Navigation") {
                it("View Controller must request detail screen") {
                    viewController.openProductDetail(product: (products?.results![0])!)
                }
            }
        }
    }
}
