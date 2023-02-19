//
//  InmanageDelegate.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 21/01/2023.
//

import Foundation

@objc public protocol InmanageDelegate: NSObjectProtocol {
    func didTapCloseInManageRatingSDK()
    func didTapHighRatingScore(score: Int)
    func didTapLowRatingScore(score: Int)
    func didSendCommentRating(comment: String)
}
