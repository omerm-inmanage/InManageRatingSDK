//
//  RateWithCommentFields.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 19/02/2023.
//

import UIKit

public class RateWithCommentFields : NSObject {
    
    let imgBackgroundHeader: UIImage
    let imgMainCenterHeader: UIImage
    var limitCommentCount: Int = 500
    let translatingMainTitle: String
    let translatingMainContent: String
    let translatingPlaceHolder: String
    let translatingBtnNoThanks: String
    let translatingBtnSendRating: String

    public init(imgBackgroundHeader: UIImage, imgMainCenterHeader: UIImage, limitCommentCount: Int, translatingMainTitle: String? = nil ,  translatingMainContent: String? = nil, translatingPlaceHolder: String? = nil, translatingBtnNoThanks: String? = nil, translatingBtnSendRating: String? = nil) {
        self.imgBackgroundHeader = imgBackgroundHeader
        self.imgMainCenterHeader = imgMainCenterHeader
        self.limitCommentCount = limitCommentCount
        self.translatingMainTitle = translatingMainTitle ?? ""
        self.translatingMainContent = translatingMainContent ?? ""
        self.translatingPlaceHolder = translatingPlaceHolder ?? ""
        self.translatingBtnNoThanks = translatingBtnNoThanks ?? ""
        self.translatingBtnSendRating = translatingBtnSendRating  ?? ""
    }
    
}
