//
//  UIImageExtenstion.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 16/02/2023.
//

import UIKit

extension UIImage {
    func withColor(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        // 1
        let drawRect = CGRect(x: 0,y: 0,width: size.width,height: size.height)
        // 2
        color.setFill()
        UIRectFill(drawRect)
        // 3
        draw(in: drawRect, blendMode: .destinationIn, alpha: 1)

        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
