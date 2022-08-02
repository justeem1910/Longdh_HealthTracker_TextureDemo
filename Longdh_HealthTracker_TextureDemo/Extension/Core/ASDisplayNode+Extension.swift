//
//  ASDisplayNode+Extension.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 28/07/2022.
//

import AsyncDisplayKit
import UIKit

extension ASDisplayNode {
  
    func showLoaderView() {
        self.view.endEditing(true)
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    
    func dismissLoaderView() {
        ProgressHUD.dismiss()
    }

}
