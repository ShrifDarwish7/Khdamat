//
//  ForgotPassVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit

class ForgotPassVC: UIViewController {

    @IBOutlet weak var newPass: CustomTFs!
    @IBOutlet weak var passTF: CustomTFs!
    
    var authPresenter: AuthPresenter?
    var emailorMobile: String?
    var otp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authPresenter = AuthPresenter(self)

        newPass.setAsPasswordField()
        passTF.setAsPasswordField()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        guard !self.passTF.text!.isEmpty, !self.newPass.text!.isEmpty else {
            showToast(message: "Please enter your new password and confirm it")
            return
        }
        guard self.passTF.text! == self.newPass.text! else {
            showToast(message: "Your confirmed password doesn`t match new password")
            return
        }
        let prms: [String: String] = [
            "emailOrmobile": self.emailorMobile!,
            "otp": self.otp!,
            "password": newPass.text!,
            "verify_password": passTF.text!
        ]
        self.authPresenter?.setNewPassword(prms)
    }
    
}
