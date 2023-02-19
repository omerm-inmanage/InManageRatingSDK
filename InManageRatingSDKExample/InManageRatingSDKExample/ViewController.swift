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

        setupAzrieli()
//        setupMcdolads()
    }
    
    private func setupAzrieli() {
        let imgRateUs = UIImage(named: "mask_group")!
        let imgThanksForRating = UIImage(named: "Group 37")!
        let imgRateInAppstore = UIImage(named: "Group 37")!
        let imgBackgroundHeader = UIImage(named: "subtract-azrieli")!
        let imgBackgroundEmptyHeader = UIImage(named: "subtract-empty-azrieli")!
        let imgRateWithComment = UIImage(named: "Group 49")!
        let color = UIColor(red: 105/255.0, green: 151/255.0, blue: 245/255.0, alpha:  1.0)
        let strAppStore:String = "itms-apps://itunes.apple.com/app/id967762450"
        
        let rateUsFields = RateUsFields(imgBackgroundHeader: imgBackgroundHeader, imgMainCenterHeader: imgRateUs)
        let rateInAppstoreFields = RateInAppstoreFields(imgBackgroundHeader: imgBackgroundEmptyHeader, imgMainCenterHeader: imgRateInAppstore)
        let rateWithCommentFields = RateWithCommentFields(imgBackgroundHeader: imgBackgroundEmptyHeader, imgMainCenterHeader: imgRateWithComment, limitCommentCount: 250)
        let thanksForRatingFields = ThanksForRatingFields(imgBackgroundHeader: imgBackgroundEmptyHeader, imgMainCenterHeader: imgThanksForRating)
        
        inManageRatingSDK.initInManageRating(appBundle: .azrieli, colorApp: color, rateUsFields: rateUsFields, thanksForRatingFields: thanksForRatingFields, rateInAppstoreFields: rateInAppstoreFields, rateWithCommentFields: rateWithCommentFields, strAppstoreUrl: strAppStore)
    }
    
    private func setupMcdolads() {
        let imgRateUs = UIImage(named: "imgRateUs")!
        let imgThanksForRating = UIImage(named: "imgThanksForRating")!
        let imgRateInAppstore = UIImage(named: "imgRateInAppstore")!
        let imgBackgroundHeader = UIImage(named: "subtract-mcdonalds")!
        let imgRateWithComment = UIImage(named: "subtract-mcdonalds")!
        let color = UIColor(red: 255/255.0, green: 194/255.0, blue: 4/255.0, alpha:  1.0)
        let strAppStore:String = "itms-apps://itunes.apple.com/app/id967762450"

        let rateUsFields = RateUsFields(imgBackgroundHeader: imgBackgroundHeader, imgMainCenterHeader: imgRateUs)
        let rateInAppstoreFields = RateInAppstoreFields(imgBackgroundHeader: imgBackgroundHeader, imgMainCenterHeader: imgRateInAppstore)
        let rateWithCommentFields = RateWithCommentFields(imgBackgroundHeader: imgBackgroundHeader, imgMainCenterHeader: imgRateWithComment, limitCommentCount: 250)
        let thanksForRatingFields = ThanksForRatingFields(imgBackgroundHeader: imgBackgroundHeader, imgMainCenterHeader: imgThanksForRating)
        
        inManageRatingSDK.initInManageRating(appBundle: .mcdonalds, colorApp: color, rateUsFields: rateUsFields, thanksForRatingFields: thanksForRatingFields, rateInAppstoreFields: rateInAppstoreFields, rateWithCommentFields: rateWithCommentFields, strAppstoreUrl: strAppStore)
    }

    // MARK: InmanageDelegate
    
    func didTapCloseInManageRatingSDK() { print("didTapCloseInManageRatingSDK") }
    
    func didTapHighRatingScore(score: Int) { print("didTapHighRatingScore \(score)") }
    
    func didTapLowRatingScore(score: Int) { print("didTapLowRatingScore \(score)") }
    
    func didSendCommentRating(comment: String) { print("didSendCommentRating \(comment)")
}
    
    // MARK: Action
    
    @IBAction func didTap(_ sender: Any) {
        inManageRatingSDK.presentRateUsScreen()
    }
}

