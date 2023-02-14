//
//  RateUsViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 08/02/2023.
//

import UIKit

class RateUsViewController: UIViewController {
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btnStar5: UIButton!
    @IBOutlet weak var btnStar4: UIButton!
    @IBOutlet weak var btnStar3: UIButton!
    @IBOutlet weak var btnStar2: UIButton!
    @IBOutlet weak var btnStar1: UIButton!
    
    @IBOutlet weak var btnSendRating: UIButton!
    @IBOutlet weak var btnNoThanks: UIButton!
    
    var viewModel: RateUsViewModel = RateUsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTranslations()
    }
    
    private func setupView() {
        img.image = InManageRating.inManageRatingModel.imgRateUs
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
        
        viewModel.model.btnArr = [btnStar1,btnStar2,btnStar3,btnStar4,btnStar5]
        
        btnSendRating.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
        btnNoThanks.setAttributeUnSelected(color: InManageRating.inManageRatingModel.colorApp)
    }
    
    private func setupTranslations() { }
    
    private func dismissView(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            if let completion = completion {
                self.dismiss(animated: true)
                completion()
            }
        }
    }
    
    @IBAction func didTapSend(_ sender: Any) {
        if viewModel.model.selectedScore > 3 {
            dismissView() {
                InManageRating.shared().presentRateInAppstore()
            }
        } else {
            dismissView() {
                InManageRating.shared().presentThanksForRatingScreen()
            }
        }
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
        InManageRating.shared().closeSDK()
    }
    
    @IBAction func didTapStar(_ sender: Any) {
        
        guard let senderBtn = sender as? UIButton else {return}
        viewModel.model.selectedScore = senderBtn.tag

        for btn in viewModel.model.btnArr {
            if btn.tag <= viewModel.model.selectedScore {
                btn.setImage(viewModel.model.imgStarSelected, for: .normal)
            } else {
                btn.setImage(viewModel.model.imgStarUnSelected, for: .normal)
            }
        }
    }
}





extension UILabel {
    func sizeFont(_ size: CGFloat) {
        self.font = self.font.withSize(size)
    }
}
