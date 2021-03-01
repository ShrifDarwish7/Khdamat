//
//  RegisterVC+AuthViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import SVProgressHUD

extension RegisterVC: AuthViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteSignUp(_ data: LoginResponse?, _ error: String?) {
        if let _ = data{
            Router.toVerifyCode(sender: self, type: .account, emailOrMobile: "")
        }else if let _ = error{
            showToast(message: error!)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
}
