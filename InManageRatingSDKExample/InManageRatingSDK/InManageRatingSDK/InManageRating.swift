//
//  InManageRating.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 21/01/2023.
//

import UIKit

@objc open class InManageRating: NSObject {
    
    private static var sharedInstance: InManageRating?
    
    @objc open weak var delegate: InmanageDelegate?
    @objc open var isDebugMode: Bool = false
    
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
    }
    
    public func welcome(sum: Int) {
        LogMsg("\(sum)")
    }
    
    
}

