//
//  File.swift
//  Easy Gate
//
//  Created by ameer on 7/15/18.
//  Copyright © 2018 JpJets. All rights reserved.
//


import Foundation
import SVProgressHUD

final class Loader {
    
    static func setup() {
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(UIColor.dark)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.setMinimumDismissTimeInterval(0.0)
    }
    
    static func show() {
        SVProgressHUD.show()
    }
    
    static func show(message: String) {
        SVProgressHUD.show(withStatus: message)
    }
    
    static func hide() {
        SVProgressHUD.dismiss()
    }
    
    static func showError(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    static func showSuccess(message: String) {
        SVProgressHUD.showSuccess(withStatus: message)
        SVProgressHUD.setMinimumDismissTimeInterval(10.0)
    }
    
    static func show(success: Bool, error: Error?) {
        guard let error = error else {
            show(success: success)
            return
        }
        showError(message: error.localizedDescription)
    }
    
    static func show(success: Bool) {
        if success {
            showSuccess(message: "Task completed")
        } else {
            showError(message: "Unable to complete task")
        }
    }
}
