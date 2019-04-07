//
//  UIView+LoadNib.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 07/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNib<T>(withName nibName: String) -> T? {
        let nib  = UINib.init(nibName: nibName, bundle: nil)
        let nibObjects = nib.instantiate(withOwner: nil, options: nil)
        for object in nibObjects {
            if let result = object as? T {
                return result
            }
        }
        return nil
    }
}
