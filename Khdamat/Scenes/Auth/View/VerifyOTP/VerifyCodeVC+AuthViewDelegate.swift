//
//  VerifyCodeVC+AuthViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation
import SVProgressHUD

extension VerifyCodeVC: AuthViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    
    func didCompeleteVerifyOtp(_ error: String?) {
        if let error = error{
            showToast(message: error)
        }else{
            Router.toForgetPass(sender: self, emailOrMobile: self.emailOrMobile!, otp: self.otp!)
        }
    }
    
    func didCompleteVerifyAccount(_ error: String?) {
        if let error = error{
            showToast(message: error)
        }else{
            
        }
    }
    
}
