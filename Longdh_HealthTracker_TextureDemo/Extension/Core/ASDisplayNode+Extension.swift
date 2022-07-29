//
//  ASDisplayNode+Extension.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 28/07/2022.
//

import AsyncDisplayKit
import UIKit

extension ASDisplayNode {
    func showActivityIndicator(toView: UIView) {
        self.view.endEditing(true)
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    
    func dismissActivityIndicator() {
        ProgressHUD.dismiss()
        
    }
    
    func showLoaderView( toView: UIView? = nil) {
        self.view.endEditing(true)
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    
    func dismissLoaderView() {
        ProgressHUD.dismiss()
    }

}
