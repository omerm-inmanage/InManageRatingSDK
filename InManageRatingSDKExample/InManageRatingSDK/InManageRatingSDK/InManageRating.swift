//
//  InManageRating.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 21/01/2023.
//

import UIKit


class InManageRatingModel: NSObject {
    var colorApp: UIColor = .black
    var strAppstoreUrl: String = ""
    var imgThanksForRating: UIImage = UIImage()
    var imgRateInAppstore: UIImage = UIImage()
    var imgRateUs: UIImage = UIImage()
}

@objc open class InManageRating: NSObject {
    
    // MARK: Private
    private static var sharedInstance: InManageRating?
    static var inManageRatingModel: InManageRatingModel = InManageRatingModel()
    private let frameworkBundle = Bundle(for: InManageRating.self)
    
    // MARK: Public
    @objc open weak var delegate: InmanageDelegate?
    @objc open var isDebugMode: Bool = false
    
    private var window: UIViewController?
    
    /**
     Initialize `InManageRating` (as singleton)
     Returns the default singleton instance. You are not allowed to create your own instances of this class.
     */
    
    @objc open class func shared() -> InManageRating {
        guard let instance = self.sharedInstance else {
            self.sharedInstance = InManageRating()
            return sharedInstance!
        }
        
        return instance
    }
    
    /**
     Destroy `InManageRating` singleton
     */
    open class func destroy() {
        self.sharedInstance = nil
    }
    
    private override init() {
        super.init()
        initCustomFont()
    }
    
    public func initInManageRating(colorApp: UIColor, imgRateUs: UIImage, imgThanksForRating: UIImage, imgRateInAppstore: UIImage, strAppstoreUrl: String) {
        InManageRating.inManageRatingModel.colorApp = colorApp
        InManageRating.inManageRatingModel.imgRateUs = imgRateUs
        InManageRating.inManageRatingModel.imgThanksForRating = imgThanksForRating
        InManageRating.inManageRatingModel.imgRateInAppstore = imgRateInAppstore
        InManageRating.inManageRatingModel.strAppstoreUrl = strAppstoreUrl
    }
    
    public func presentThanksForRatingScreen() {
        let vc = ThanksForRatingViewController(nibName: ThanksForRatingViewController.className, bundle: frameworkBundle)
        if let nv = window {
            nv.modalTransitionStyle = .crossDissolve
            nv.modalPresentationStyle = .overCurrentContext
            nv.present(vc, animated: true)
        }
    }
    
    public func presentRateUsScreen() {
        let vc = RateUsViewController(nibName: RateUsViewController.className, bundle: frameworkBundle)
        if let nv = UIApplication.getTopViewController() {
            window = nv
            nv.modalTransitionStyle = .crossDissolve
            nv.modalPresentationStyle = .overCurrentContext
            nv.present(vc, animated: true)
        }
    }
    
    public func presentRateInAppstore() {
        let vc = RateInAppstoreViewController(nibName: RateInAppstoreViewController.className, bundle: frameworkBundle)
        if let nv = window {
            nv.modalTransitionStyle = .crossDissolve
            nv.modalPresentationStyle = .overCurrentContext
            nv.present(vc, animated: true)
        }
    }
    
    public func closeSDK() {
        if let window = window {
            window.dismiss(animated: true)
        }
    }
    
    private func initCustomFont() {
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Regular.ttf",
            bundle: frameworkBundle
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Medium.ttf",
            bundle: frameworkBundle
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Bold.ttf",
            bundle: frameworkBundle
        )
    }
}
