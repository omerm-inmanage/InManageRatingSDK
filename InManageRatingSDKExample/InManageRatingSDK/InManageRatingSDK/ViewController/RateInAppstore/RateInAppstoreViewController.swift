//
//  RateInAppstoreViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

class RateInAppstoreViewController: UIViewController {
    
    @IBOutlet weak var imgBackgroundHeader: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnNoThanks: UIButton!
    @IBOutlet weak var btnAppStore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        imgBackgroundHeader.image = InManageRating.inManageRatingModel.rateInAppstoreFields?.imgBackgroundHeader
        img.image = InManageRating.inManageRatingModel.rateInAppstoreFields?.imgMainCenterHeader
        
        btnAppStore.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
        btnNoThanks.setAttributeUnSelected(color: InManageRating.inManageRatingModel.colorApp)
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
    // MARK: Actions

    @IBAction func didTapNoThanks(_ sender: Any) {
        dismissView() {
            InManageRating.shared().presentThanksForRatingScreen()
        }
    }
    
    @IBAction func didTapRatingAppStore(_ sender: Any) {
        if let url = URL(string: InManageRating.inManageRatingModel.strAppstoreUrl) {
            UIApplication.shared.open(url)
        }
        dismissView() {
            InManageRating.shared().presentThanksForRatingScreen()
        }
    }
}
