//
//  ViewController.swift
//  InManageRatingSDKExample
//
//  Created by Omer Cohen on 21/01/2023.
//

import UIKit
import InManageRatingSDK

class ViewController: UIViewController {
    
    var inManageRatingSDK: InManageRating!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inManageRatingSDK = InManageRating.shared()
        inManageRatingSDK.isDebugMode = true
        inManageRatingSDK.welcome(sum: 0)
    }


}

