//
//  NSObjectExtenstion.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
