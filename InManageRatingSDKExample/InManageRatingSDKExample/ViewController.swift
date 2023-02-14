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
        setupView()
    }
    
    private func setupView() {
        inManageRatingSDK = InManageRating.shared()
        inManageRatingSDK.isDebugMode = true
        inManageRatingSDK.delegate = self
        
        let imgRateUs = UIImage(named: "imgRateUs")!
        let imgThanksForRating = UIImage(named: "imgThanksForRating")!
        let imgRateInAppstore = UIImage(named: "imgRateInAppstore")!
        let color = UIColor.green
        let strAppStore:String = "itms-apps://itunes.apple.com/app/id967762450"

        inManageRatingSDK.initInManageRating(colorApp: color, imgRateUs: imgRateUs, imgThanksForRating: imgThanksForRating, imgRateInAppstore: imgRateInAppstore, strAppstoreUrl: strAppStore)
    }

    // MARK: InmanageDelegate

    func didCloseInManageRatingSDK() {
        print("didCloseInManageRatingSDK")
    }
    
    @IBAction func didTap(_ sender: Any) {
        inManageRatingSDK.presentRateUsScreen()
    }
}

