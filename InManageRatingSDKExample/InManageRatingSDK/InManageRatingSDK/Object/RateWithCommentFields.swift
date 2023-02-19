//
//  RateWithCommentFields.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 19/02/2023.
//

import UIKit

@objcMembers
public class RateWithCommentFields : NSObject {
    
    let imgBackgroundHeader: UIImage
    let imgMainCenterHeader: UIImage
    var limitCommentCount: Int = 500
 
    public init(imgBackgroundHeader: UIImage, imgMainCenterHeader: UIImage, limitCommentCount: Int) {
        self.imgBackgroundHeader = imgBackgroundHeader
        self.imgMainCenterHeader = imgMainCenterHeader
        self.limitCommentCount = limitCommentCount
    }
    
}
