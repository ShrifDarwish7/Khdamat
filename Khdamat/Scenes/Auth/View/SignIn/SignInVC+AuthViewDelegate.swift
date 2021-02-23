//
//  SignInVC+AuthViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import SVProgressHUD

extension SignInVC: AuthViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteLoginWith(_ data: LoginResponse?, _ error: String?) {
        if let _ = data{
            Router.toHome(sender: self)
        }else if let error = error{
            self.showToast(message: error)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
    
}
