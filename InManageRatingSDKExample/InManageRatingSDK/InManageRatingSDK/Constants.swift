//
//  Constants.swift
//  InManageRatingSDK
//
//  Created by Omer Cohen on 21/01/2023.
//

import Foundation

public typealias Dict = [String: Any]

let apiVersion = "1.0"
let defaultPath = "api/light/iphone/\(apiVersion)/"
let logHelper = "\n\t\t"

public class Constants {
    #if DEBUG
    static let debugMode = true
    #else
    static let debugMode = false
    #endif
}

func LogMsg(_ logMessage: Any) {
    if InManageRating.shared().isDebugMode {
        print("InManageRatingSDK: \(logMessage)")
    } else { return }
}
