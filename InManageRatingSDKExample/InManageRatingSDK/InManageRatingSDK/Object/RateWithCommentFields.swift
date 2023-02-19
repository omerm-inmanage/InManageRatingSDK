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
 
    public init(imgBackgroundHeader: UIImage, imgMainCenterHeader: UIImage) {
        self.imgBackgroundHeader = imgBackgroundHeader
        self.imgMainCenterHeader = imgMainCenterHeader
    }
    
}
