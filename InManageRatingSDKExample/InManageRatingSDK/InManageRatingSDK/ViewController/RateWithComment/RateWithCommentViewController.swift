//
//  
//  RateWithCommentViewController.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 16/02/2023.
//
//


import UIKit

class RateWithCommentViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var imgBackgroundHeader: UIImageView!
    @IBOutlet weak var imgCenterHeader: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var btnNoThanks: UIButton!
    
    let viewModel: RateWithCommentViewModel = RateWithCommentViewModel()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillStaticOutletsWithTranslations()
        setupView()
    }
    
    //MARK: Setup
    
    private func fillStaticOutletsWithTranslations() { }
    
    private func setupView() {
        
        // Setup UITextView
        textView.delegate = self
        textView.layer.cornerRadius = 12
        textView.layer.masksToBounds = true
        textView.bottomSpace()

        // Setup UIToolbar
        let bar = UIToolbar()
        let flexButtonRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let reset = UIBarButtonItem(title: "אישור", style: .done, target: self, action: #selector(closeKeyBoard))
        let flexButtonLeft = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        bar.items = [flexButtonRight,reset,flexButtonLeft]
        bar.sizeToFit()
        textView.inputAccessoryView = bar
        
        imgBackgroundHeader.image = InManageRating.inManageRatingModel.rateWithCommentFields?.imgBackgroundHeader
        imgCenterHeader.image = InManageRating.inManageRatingModel.rateWithCommentFields?.imgMainCenterHeader
        
        let colorApp = InManageRating.inManageRatingModel.colorApp
        
        viewContent.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 18)
        viewHeader.roundCorners(corners: [.topLeft, .topRight], radius: 18)

        btnSend.setAttributeSelected(color:colorApp)
        btnNoThanks.setAttributeUnSelected(color:colorApp)
    }
    
    // MARK: UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= viewModel.model.limitCommentCount
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        lblPlaceHolder.isHidden = !textView.text.isEmpty ? true : false
    }

    //MARK: Actions
    
    @IBAction func didTapSend(_ sender: Any) {
        self.dismissView() {
            if !self.textView.text.isEmpty {
                InManageRating.shared().delegate?.didSendCommentRating(comment: self.textView.text)
                InManageRating.shared().presentRateInAppstore()
            }
        }
    }

    @IBAction func didTapNoThanks(_ sender: Any) {
        // Update Three App
        InManageRating.shared().delegate?.didTapCloseInManageRatingSDK()
        
        // Close SDK
        InManageRating.shared().closeSDK()
    }
    
    @objc func closeKeyBoard() {
        self.view.endEditing(true)
    }
}
