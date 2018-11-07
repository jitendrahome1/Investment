//
//  UIView+Inverstment.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 02/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    class func fromNib<T: UIView>() -> T? {
            return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
        }
    func cornerRadius(value: Double) {
        self.layer.cornerRadius = CGFloat(value)
        
    }

}
    

    

