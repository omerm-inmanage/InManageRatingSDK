//
//  RateInAppstoreViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 09/02/2023.
//

import UIKit

class RateInAppstoreViewController: UIViewController {
    
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
        img.image = InManageRating.inManageRatingModel.imgRateInAppstore
        
        btnAppStore.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
        btnNoThanks.setAttributeUnSelected(color: InManageRating.inManageRatingModel.colorApp)
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
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
    
    @IBAction func didTapNoThanks(_ sender: Any) {
        InManageRating.shared().closeSDK()
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
