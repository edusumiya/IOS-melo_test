//
//  ErrorServiceViewController.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 08/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit

class ErrorServiceViewController: UIViewController {
    
    var delegate: ErrorServiceProtocol!
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    
    @IBAction func tryAgain(_ sender: Any) {
        delegate.tryAgain()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
