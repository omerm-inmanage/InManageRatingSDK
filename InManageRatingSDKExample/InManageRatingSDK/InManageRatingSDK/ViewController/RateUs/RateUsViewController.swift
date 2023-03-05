//
//  RateUsViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 08/02/2023.
//

import UIKit

class RateUsViewController: UIViewController {
    
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblMainContent: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imgBackgroundHeader: UIImageView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btnStar5: UIButton!
    @IBOutlet weak var btnStar4: UIButton!
    @IBOutlet weak var btnStar3: UIButton!
    @IBOutlet weak var btnStar2: UIButton!
    @IBOutlet weak var btnStar1: UIButton!
    
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    
    @IBOutlet weak var btnSendRating: UIButton!
    @IBOutlet weak var btnNoThanks: UIButton!
    
    var viewModel: RateUsViewModel = RateUsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTranslations()
    }
    
    private func setupView() {
        
        imgBackgroundHeader.image = InManageRating.inManageRatingModel.rateUsFields?.imgBackgroundHeader
        img.image = InManageRating.inManageRatingModel.rateUsFields?.imgMainCenterHeader
        
        let colorApp = InManageRating.inManageRatingModel.colorApp
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
        
        viewModel.model.btnArr = [btnStar1,btnStar2,btnStar3,btnStar4,btnStar5]
        viewModel.model.imgArr = [imgStar1,imgStar2,imgStar3,imgStar4,imgStar5]

        btnSendRating.setAttributeSelected(color:colorApp)
        btnNoThanks.setAttributeUnSelected(color:colorApp)
        
        let image = UIImage(named: "star_selected",
                            in:  Bundle(for: InManageRating.self),
                            compatibleWith: nil)
        
        viewModel.model.imgStarSelected = image?.withColor(colorApp)
        
        setupChosenDefaultRate()
    }
    
    func setupChosenDefaultRate() {
        if InManageRating.inManageRatingModel.chosenDefaultRate > 0 {
            viewModel.model.selectedScore = InManageRating.inManageRatingModel.chosenDefaultRate
            for btn in viewModel.model.btnArr {
                if btn.tag <= InManageRating.inManageRatingModel.chosenDefaultRate {
                    viewModel.model.imgArr[btn.tag - 1].image = viewModel.model.imgStarSelected
                } else {
                    viewModel.model.imgArr[btn.tag - 1].image = viewModel.model.imgStarUnSelected
                }
            }
        }
    }
    
    private func setupTranslations() {
        
        if let translatingMainTitle = InManageRating.inManageRatingModel.rateUsFields?.translatingMainTitle {
            if !translatingMainTitle.isEmpty {
                lblMainTitle.text = translatingMainTitle
            }
        }
        
        if let translatingMainContent = InManageRating.inManageRatingModel.rateUsFields?.translatingMainContent{
            if !translatingMainContent.isEmpty {
                lblMainContent.text = translatingMainContent
            }
        }
        
        if let translatingBtnSendRating = InManageRating.inManageRatingModel.rateUsFields?.translatingBtnSendRating {
            if !translatingBtnSendRating.isEmpty {
                btnSendRating.setTitle(translatingBtnSendRating, for: .normal)
            }
        }
        
        if let translatingBtnNoThanks = InManageRating.inManageRatingModel.rateUsFields?.translatingBtnNoThanks {
            if !translatingBtnNoThanks.isEmpty {
                btnNoThanks.setTitle(translatingBtnNoThanks, for: .normal)
            }
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func didTapSend(_ sender: Any) {
        if viewModel.model.selectedScore == 0 {return}
        
        if viewModel.model.selectedScore > 3 {
            self.dismissView() {
                InManageRating.shared().delegate?.didTapHighRatingScore(score: self.viewModel.model.selectedScore)
                InManageRating.shared().presentRateInAppstore()
            }
        } else {
            self.dismissView() {
                InManageRating.shared().delegate?.didTapLowRatingScore(score: self.viewModel.model.selectedScore)
                if InManageRating.inManageRatingModel.appBundle == .azrieli {
                    InManageRating.shared().presentRateWithComment()
                } else {
                    InManageRating.shared().presentThanksForRatingScreen()
                }
            }
        }
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
        // Update Three App
        InManageRating.shared().delegate?.didTapCloseInManageRatingSDK()
        
        // Close SDK
        InManageRating.shared().closeSDK()
    }
    
    @IBAction func didTapStar(_ sender: Any) {
        guard let senderBtn = sender as? UIButton else {return}
        viewModel.model.selectedScore = senderBtn.tag

        for btn in viewModel.model.btnArr {
            if btn.tag <= viewModel.model.selectedScore {
                viewModel.model.imgArr[btn.tag - 1].image = viewModel.model.imgStarSelected
            } else {
                viewModel.model.imgArr[btn.tag - 1].image = viewModel.model.imgStarUnSelected
            }
        }
    }
}



