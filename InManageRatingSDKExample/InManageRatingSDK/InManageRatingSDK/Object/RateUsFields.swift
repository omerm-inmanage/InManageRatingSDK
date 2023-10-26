//
//  RateUsFields.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 19/02/2023.
//

import UIKit

@objcMembers

public class RateUsFields : NSObject {
    
    let imgBackgroundHeader: UIImage
    let imgMainCenterHeader: UIImage
    let translatingMainTitle: String
    let translatingMainContent: String
    let translatingBtnNoThanks: String
    let translatingBtnSendRating: String

    public init(imgBackgroundHeader: UIImage, imgMainCenterHeader: UIImage, translatingMainTitle: String? = nil ,  translatingMainContent: String? = nil, translatingBtnNoThanks: String? = nil, translatingBtnSendRating: String? = nil) {
        self.imgBackgroundHeader = imgBackgroundHeader
        self.imgMainCenterHeader = imgMainCenterHeader
        self.translatingMainTitle = translatingMainTitle ?? ""
        self.translatingMainContent = translatingMainContent ?? ""
        self.translatingBtnNoThanks = translatingBtnNoThanks ?? ""
        self.translatingBtnSendRating = translatingBtnSendRating  ?? ""
    }
    
}


