//
//  BaseViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    func showProgressHUD() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func hideProgressHUD() {
        PKHUD.sharedHUD.hide()
    }
    
    func displayErrorMessage(message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
}
