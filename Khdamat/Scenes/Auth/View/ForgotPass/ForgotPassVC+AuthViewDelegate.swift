//
//  ForgotPassVC+AuthViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation
import SVProgressHUD

extension ForgotPassVC: AuthViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    
    func didCompleteWithNewPassword(_ error: String?) {
        if let error = error{
            showToast(message: error)
        }else{
            
        }
    }
    
}
