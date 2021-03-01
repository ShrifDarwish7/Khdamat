//
//  SignInVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: CustomTFs!
    @IBOutlet weak var passTF: CustomTFs!
    @IBOutlet weak var checkedBtn: RoundedButton!
    
    var authPresenter: AuthPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authPresenter = AuthPresenter(self)
        
        passTF.setAsPasswordField()

    }
    
    @IBAction func rememberMeAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            sender.setImage(UIImage(named: "doneIc"), for: .normal)
            sender.tintColor = .white
            sender.backgroundColor = UIColor(named: "MainColor")
            sender.tag = 1
        case 1:
            sender.setImage(UIImage(), for: .normal)
            sender.tag = 0
        default:
            break
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotPass(_ sender: Any) {
        guard !emailTF.text!.isEmpty else {
            showToast(message: "First enter your email or phone")
            return
        }
        authPresenter.forgetPassword(["emailOrmobile": self.emailTF.text!])
        
    }
    
    @IBAction func signinAction(_ sender: Any) {
        guard !self.emailTF.text!.isEmpty, !self.passTF.text!.isEmpty else {
            showToast(message: "Please enter your email and password")
            return
        }
        let prms: [String: String] = [
            "email": emailTF.text!,
            "password": passTF.text!
        ]
        authPresenter.login(prms)
    }
}
