//
//  RateUsModel.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

class RateUsModel: NSObject {
    
    var btnArr: [UIButton] = []
    var imgArr: [UIImageView] = []
    var selectedScore: Int = 0
    var imgStarSelected = UIImage(named: "star_selected",
                        in: Bundle(for: InManageRating.self),
                        compatibleWith: nil)
    var imgStarUnSelected = UIImage(named: "star_not_selected",
                        in: Bundle(for: InManageRating.self),
                        compatibleWith: nil)
}
