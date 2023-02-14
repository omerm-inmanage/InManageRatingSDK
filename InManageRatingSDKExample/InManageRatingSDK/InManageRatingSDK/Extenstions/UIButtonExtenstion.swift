//
//  UIButtonExtenstion.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 14/02/2023.
//

import Foundation
import UIKit

extension UIButton {
    
    func setAttributeSelected(color: UIColor) {
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = color.cgColor
        self.setTitleColor(.black, for: .normal)
    }
    
    func setAttributeUnSelected(color: UIColor) {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        self.layer.borderColor = color.cgColor
        self.setTitleColor(.black, for: .normal)
    }
}
