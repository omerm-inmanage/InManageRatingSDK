//
//  InManageRating.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 21/01/2023.
//

import UIKit

public enum AppBundle {
    case mcdonalds
    case azrieli
    case none
}

class InManageRatingModel: NSObject {
    var colorApp: UIColor = .black
    var colorStarApp: UIColor = .black
    var secondaryColor: UIColor?
    var strAppstoreUrl: String = ""
    var appBundle: AppBundle = .none
    var chosenDefaultRate: Int = 0
    var rateUsFields: RateUsFields?
    var rateInAppstoreFields: RateInAppstoreFields?
    var rateWithCommentFields: RateWithCommentFields?
    var thanksForRatingFields: ThanksForRatingFields?
    var userScoreRating: Int = 0
}
 open class InManageRating: NSObject {
    
    // MARK: Private
    private static var sharedInstance: InManageRating?
    static var inManageRatingModel: InManageRatingModel = InManageRatingModel()
    private let frameworkBundle = Bundle(for: InManageRating.self)
    
    // MARK: Public
    open weak var delegate: InmanageDelegate?
    open var isDebugMode: Bool = false
    
    private var window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    private let navigation = UINavigationController()

    /**
     Initialize `InManageRating` (as singleton)
     Returns the default singleton instance. You are not allowed to create your own instances of this class.
     */
    
    open class func shared() -> InManageRating {
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
    
    public func initInManageRating(appBundle: AppBundle, colorApp: UIColor, colorStarApp: UIColor, secondaryColor: UIColor? = nil, rateUsFields: RateUsFields, thanksForRatingFields: ThanksForRatingFields, rateInAppstoreFields: RateInAppstoreFields, rateWithCommentFields: RateWithCommentFields, strAppstoreUrl: String, chosenDefaultRate: Int = 0) {
        
        InManageRating.inManageRatingModel.appBundle = .azrieli
        InManageRating.inManageRatingModel.colorApp = colorApp
        InManageRating.inManageRatingModel.colorStarApp = colorStarApp
        InManageRating.inManageRatingModel.secondaryColor = secondaryColor
        InManageRating.inManageRatingModel.strAppstoreUrl = strAppstoreUrl
        InManageRating.inManageRatingModel.rateUsFields = rateUsFields
        InManageRating.inManageRatingModel.rateInAppstoreFields = rateInAppstoreFields
        InManageRating.inManageRatingModel.rateWithCommentFields = rateWithCommentFields
        InManageRating.inManageRatingModel.thanksForRatingFields = thanksForRatingFields
            InManageRating.inManageRatingModel.chosenDefaultRate = chosenDefaultRate
        
    }
    
    public func presentThanksForRatingScreen() {
        let vc = ThanksForRatingViewController(nibName: ThanksForRatingViewController.className, bundle: frameworkBundle)
        navigation.popViewController(animated: true)
        navigation.viewControllers = [vc]
    }
    
    public func presentRateUsScreenTest(uiview: UIView) {
        let vc = RateUsViewController(nibName: RateUsViewController.className, bundle: frameworkBundle)
        navigation.viewControllers = [vc]
//        self.window.rootViewController = navigation
//        self.window.makeKeyAndVisible()
    }
    
    public func presentRateUsScreen() {
        let vc = RateUsViewController(nibName: RateUsViewController.className, bundle: frameworkBundle)
        navigation.viewControllers = [vc]
        self.window.rootViewController = navigation
        self.window.makeKeyAndVisible()
    }
    
    public func presentRateInAppstore() {
        let vc = RateInAppstoreViewController(nibName: RateInAppstoreViewController.className, bundle: frameworkBundle)
        navigation.popViewController(animated: true)
        navigation.viewControllers = [vc]
    }
    
    public func presentRateWithComment() {
        let vc = RateWithCommentViewController(nibName: RateWithCommentViewController.className, bundle: frameworkBundle)
        navigation.popViewController(animated: true)
        navigation.viewControllers = [vc]
    }
    
    public func closeSDK() {
        self.window.dismiss()
    }
    
    private func initCustomFont() {
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Regular.ttf",
            bundle: frameworkBundle
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Black.ttf",
            bundle: frameworkBundle
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Bold.ttf",
            bundle: frameworkBundle
        )
    }
}


extension UIWindow {
    func dismiss() {
        isHidden = true

        if #available(iOS 13, *) {
            windowScene = nil
        }
    }
}
