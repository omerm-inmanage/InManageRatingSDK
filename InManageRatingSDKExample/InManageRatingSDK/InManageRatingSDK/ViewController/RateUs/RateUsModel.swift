//
//  RateUsModel.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

class RateUsModel: NSObject {
    
    var btnArr: [UIButton] = []
    var selectedScore: Int = 5
    let imgStarSelected = UIImage(named: "star_selected",
                        in: Bundle(for: InManageRating.self),
                        compatibleWith: nil)
    let imgStarUnSelected = UIImage(named: "star_not_selected",
                        in: Bundle(for: InManageRating.self),
                        compatibleWith: nil)
}
