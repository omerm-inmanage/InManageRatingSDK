//
//  ViewController.swift
//  InManageRatingSDKExample
//
//  Created by Omer Cohen on 21/01/2023.
//

import UIKit
import InManageRatingSDK

class ViewController: UIViewController, InmanageDelegate {
    
    var inManageRatingSDK: InManageRating!
    
    // MARK: Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        inManageRatingSDK = InManageRating.shared()
        inManageRatingSDK.isDebugMode = true
        inManageRatingSDK.delegate = self
        inManageRatingSDK.welcome(sum: 0)
    }

    // MARK: InmanageDelegate

    func didCloseInManageRatingSDK() {
        print("d")
    }
    
    @IBAction func didTap(_ sender: Any) {
        print("גג")
    }
}

