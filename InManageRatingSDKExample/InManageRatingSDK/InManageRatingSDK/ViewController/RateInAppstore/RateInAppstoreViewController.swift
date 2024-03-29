//
//  RateInAppstoreViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

class RateInAppstoreViewController: UIViewController {
    
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblMainContent: UILabel!
    @IBOutlet weak var imgBackgroundHeader: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnNoThanks: UIButton!
    @IBOutlet weak var btnAppStore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTranslations()
    }
    
    private func setupView() {
        imgBackgroundHeader.image = InManageRating.inManageRatingModel.rateInAppstoreFields?.imgBackgroundHeader
        img.image = InManageRating.inManageRatingModel.rateInAppstoreFields?.imgMainCenterHeader
        
        if let secondaryColor = InManageRating.inManageRatingModel.secondaryColor {
            btnAppStore.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
            btnAppStore.setTitleColor(secondaryColor, for: .normal)
            
            btnNoThanks.setAttributeUnSelected(color:InManageRating.inManageRatingModel.colorApp)
            btnNoThanks.setTitleColor(InManageRating.inManageRatingModel.colorApp, for: .normal)
        } else {
            btnAppStore.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
            btnNoThanks.setAttributeUnSelected(color:InManageRating.inManageRatingModel.colorApp)
        }

        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
    private func setupTranslations() {
        
        if let translatingMainTitle = InManageRating.inManageRatingModel.rateInAppstoreFields?.translatingMainTitle {
            if !translatingMainTitle.isEmpty {
                lblMainTitle.text = translatingMainTitle
            }
        }
        
        if let translatingMainContent = InManageRating.inManageRatingModel.rateInAppstoreFields?.translatingMainContent{
            if !translatingMainContent.isEmpty {
                lblMainContent.text = translatingMainContent
            }
        }
        
        if let translatingBtnAppStore = InManageRating.inManageRatingModel.rateInAppstoreFields?.translatingBtnAppStore {
            if !translatingBtnAppStore.isEmpty {
                btnAppStore.setTitle(translatingBtnAppStore, for: .normal)
            }
        }
        
        if let translatingBtnNoThanks = InManageRating.inManageRatingModel.rateInAppstoreFields?.translatingBtnNoThanks {
            if !translatingBtnNoThanks.isEmpty {
                btnNoThanks.setTitle(translatingBtnNoThanks, for: .normal)
            }
        }
        
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
