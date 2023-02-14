//
//  UIViewExtenstion.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func removeCustom(withDuration: TimeInterval) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 0
            self.layoutIfNeeded()
        }) { finished in
            self.removeFromSuperview()
        }
    }
    
}
