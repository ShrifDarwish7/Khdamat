//
//  VerifyCodeVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit

class VerifyCodeVC: UIViewController {

    @IBOutlet weak var code1: UITextField!
    @IBOutlet weak var code2: UITextField!
    @IBOutlet weak var code3: UITextField!
    @IBOutlet weak var code4: UITextField!
    @IBOutlet weak var code5: UITextField!
    @IBOutlet weak var code6: UITextField!
    
    var verifyType: VerifyType?
    var authPresenter: AuthPresenter?
    var emailOrMobile: String?
    var otp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authPresenter = AuthPresenter(self)
        
        code1.becomeFirstResponder()
        
        code1.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)
        code2.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)
        code3.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)
        code4.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)
        code5.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)
        code6.addTarget(self, action: #selector(beginEnterCode(textField:)), for: .editingChanged)

    }
    
    
    @objc func beginEnterCode(textField: UITextField){
        
        let char = textField.text!.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")

        switch textField.tag{
        case 1:
            if (isBackSpace == -92) {
                break
            }
            code2.becomeFirstResponder()
        case 2:
            if (isBackSpace == -92) {
                code1.becomeFirstResponder()
                break
            }
            code3.becomeFirstResponder()
        case 3:
            if (isBackSpace == -92) {
                code2.becomeFirstResponder()
                break
            }
            code4.becomeFirstResponder()
        case 4:
            if (isBackSpace == -92) {
                code3.becomeFirstResponder()
                break
            }
            code5.becomeFirstResponder()
        case 5:
            if (isBackSpace == -92) {
                code4.becomeFirstResponder()
                break
            }
            code6.becomeFirstResponder()
        case 6:
            if (isBackSpace == -92) {
                code5.becomeFirstResponder()
                break
            }
            code6.becomeFirstResponder()
        default:
            break
        } 
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func next(_ sender: Any) {
        guard !(self.code1.text?.isEmpty)!,!(self.code2.text?.isEmpty)!,!(self.code3.text?.isEmpty)!,!(self.code4.text?.isEmpty)!/*,!(self.code5.text?.isEmpty)!, !(self.code6.text?.isEmpty)!*/ else {
            return
        }
        self.otp = (self.code1.text! + self.code2.text! + self.code3.text! + self.code4.text! + self.code5.text!)
        switch self.verifyType {
        case .forgotPass:
            let prms: [String: String] = [
                "emailOrmobile": self.emailOrMobile!,
                "otp": self.otp!
            ]
            self.authPresenter?.verifyOtp(prms)
        case .account:
            let prms: [String: String] = [
                "otp": self.otp!
            ]
            self.authPresenter?.verifyAccount(prms)
        default:
            break
        }
        
    }
    
}

enum VerifyType{
    case account
    case forgotPass
}
