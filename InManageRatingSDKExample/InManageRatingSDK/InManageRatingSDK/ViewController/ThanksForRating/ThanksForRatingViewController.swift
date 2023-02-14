//
//  ThanksForRatingViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 08/02/2023.
//


import UIKit

class ThanksForRatingViewController: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        img.image = InManageRating.inManageRatingModel.imgThanksForRating
        btnClose.setAttributeSelected(color:InManageRating.inManageRatingModel.colorApp)
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
    @IBAction func didTapCloseSDK(_ sender: Any) {
        InManageRating.shared().closeSDK()
    }
    
}
