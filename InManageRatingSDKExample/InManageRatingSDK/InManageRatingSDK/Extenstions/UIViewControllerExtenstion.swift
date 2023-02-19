//
//  UIViewControllerExtenstion.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 16/02/2023.
//

import UIKit

extension UIViewController {
    
    func dismissView(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            if let completion = completion {
                self.dismiss(animated: true)
                completion()
            }
        }
    }
}
