//
//  BaseViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit
import HUD

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    func showProgressHUD() {
        HUD.show(.loading, text: "Carregando")
    }
    
    func hideProgressHUD() {
        HUD.dismiss()
    }
    
    func displayErrorMessage(message: String) {
        HUD.show(.error, text: message, time: 2000, completion: nil)
    }
}
