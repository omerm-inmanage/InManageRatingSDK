//
//  ThanksForRatingViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 08/02/2023.
//


import UIKit

class ThanksForRatingViewController: UIViewController {

    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblMainContent: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var imgBackgroundHeader: UIImageView!
    @IBOutlet weak var topMainConstarint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTranslations()
    }
    
    func setupView() {
        
        if InManageRating.inManageRatingModel.appBundle == .azrieli {
            img.image = InManageRating.inManageRatingModel.thanksForRatingFields?.imgMainCenterHeader
            imgBackgroundHeader.image = InManageRating.inManageRatingModel.thanksForRatingFields?.imgBackgroundHeader
        } else if InManageRating.inManageRatingModel.appBundle == .mcdonalds {
            imgBackgroundHeader.contentMode = .scaleAspectFill
            imgBackgroundHeader.image = InManageRating.inManageRatingModel.thanksForRatingFields?.imgMainCenterHeader
        } else {
            imgBackgroundHeader.contentMode = .scaleAspectFill
        }
        
        if let secondaryColor = InManageRating.inManageRatingModel.secondaryColor {
            btnClose.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
            btnClose.setTitleColor(secondaryColor, for: .normal)
        } else {
            btnClose.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
        }
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
    private func setupTranslations() {
        
        if InManageRating.inManageRatingModel.userScoreRating > 3  {
            
            if let translatingMainTitleHighRating = InManageRating.inManageRatingModel.thanksForRatingFields?.translatingMainTitleHighRating {
                if !translatingMainTitleHighRating.isEmpty {
                    lblMainTitle.text = translatingMainTitleHighRating
                }
            }
             
        } else {
            if let translatingMainTitleLowRating = InManageRating.inManageRatingModel.thanksForRatingFields?.translatingMainTitleLowRating {
                if !translatingMainTitleLowRating.isEmpty {
                    lblMainTitle.text = translatingMainTitleLowRating
                }
            }
            
            if let translatingMainContent = InManageRating.inManageRatingModel.thanksForRatingFields?.translatingMainContent {
                if !translatingMainContent.isEmpty {
                    lblMainContent.text = translatingMainContent
                }
            }
        }
             
        
        if InManageRating.inManageRatingModel.userScoreRating > 3  {
            lblMainContent.text = ""
            topMainConstarint.constant = 30
        } else {
            if let translatingMainContent = InManageRating.inManageRatingModel.thanksForRatingFields?.translatingMainContent{
                if !translatingMainContent.isEmpty {
                    lblMainContent.text = translatingMainContent
                }
            }
        }
        
        if let translatingBtnClose = InManageRating.inManageRatingModel.thanksForRatingFields?.translatingBtnClose{
            if !translatingBtnClose.isEmpty {
                btnClose.setTitle(translatingBtnClose, for: .normal)
            }
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func didTapCloseSDK(_ sender: Any) {
        // Update Three App
        InManageRating.shared().delegate?.didTapCloseInManageRatingSDK()
        
        // Close SDK 
        InManageRating.shared().closeSDK()
    }
    
}
