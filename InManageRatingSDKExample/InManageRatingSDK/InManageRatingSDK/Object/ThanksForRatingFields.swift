//
//  ThanksForRatingFields.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 19/02/2023.
//

import UIKit


public class ThanksForRatingFields : NSObject {
    
    let imgBackgroundHeader: UIImage
    let imgMainCenterHeader: UIImage
    let translatingMainTitleLowRating: String
    let translatingMainTitleHighRating: String
    let translatingMainContent: String
    let translatingBtnClose: String
 
    public init(imgBackgroundHeader: UIImage, imgMainCenterHeader: UIImage, translatingMainTitleLowRating: String? = nil,  translatingMainTitleHighRating: String? = nil, translatingMainContent: String? = nil, translatingBtnClose:String? = nil) {
        self.imgBackgroundHeader = imgBackgroundHeader
        self.imgMainCenterHeader = imgMainCenterHeader
        self.translatingMainTitleLowRating = translatingMainTitleLowRating ?? ""
        self.translatingMainTitleHighRating = translatingMainTitleHighRating ?? ""
        self.translatingMainContent = translatingMainContent ?? ""
        self.translatingBtnClose = translatingBtnClose ?? ""
    }
    
}
