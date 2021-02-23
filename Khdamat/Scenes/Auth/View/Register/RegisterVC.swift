//
//  RegisterVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit
import FlagPhoneNumber
import UITextField_Navigation

class RegisterVC: UIViewController {

    @IBOutlet weak var fullNameTF: CustomTFs!
    @IBOutlet weak var emailTF: CustomTFs!
    @IBOutlet weak var FPNContainer: ViewCorners!
    @IBOutlet weak var passTF: CustomTFs!
    @IBOutlet weak var confirmPassTF: CustomTFs!
    
    var FPNTextfield : FPNTextField?
    var dialCode = ""
    var selectedFPNContryCode: String?
    var authPresenter: AuthPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        authPresenter = AuthPresenter(self)
    }
    
    func loadUI(){
        FPNTextfield = FPNTextField(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: FPNContainer.frame.height))
        FPNTextfield!.delegate = self
        FPNTextfield!.setCountries(excluding: [FPNCountryCode.IL])
        FPNTextfield!.setFlag(countryCode: FPNCountryCode.EG)
        FPNTextfield!.keyboardType = .asciiCapableNumberPad
       // FPNTextfield!.hasPhoneNumberExample = true
        FPNTextfield!.semanticContentAttribute = .forceLeftToRight
        FPNTextfield!.textAlignment = .left
        FPNContainer.addSubview(FPNTextfield!)
        FPNTextfield?.placeholder = " Enter the phone number"
        
        fullNameTF.nextNavigationField = FPNTextfield
        FPNTextfield?.nextNavigationField = emailTF
        
        
        passTF.setAsPasswordField()
        confirmPassTF.setAsPasswordField()
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signinACtion(_ sender: Any) {
        Router.toSignin(sender: self)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        guard !fullNameTF.text!.isEmpty, !emailTF.text!.isEmpty, !(FPNTextfield?.text!.isEmpty)!, !self.dialCode.isEmpty, !passTF.text!.isEmpty, !confirmPassTF.text!.isEmpty else {
            showToast(message: "Please fill out all required fields")
            return
        }
        guard passTF.text == confirmPassTF.text else {
            showToast(message: "please confirm your password")
            return
        }
        let prms: [String: String] = [
            "name": fullNameTF.text!,
            "email": emailTF.text!,
            "code": dialCode,
            "phone": FPNTextfield!.text!,
            "password": passTF.text!,
            "verify_password": confirmPassTF.text!
        ]
        authPresenter.signup(prms)
    }
    
    
}

extension RegisterVC: FPNTextFieldDelegate{
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        self.dialCode = dialCode
        self.selectedFPNContryCode = code
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
    }
    
    func fpnDisplayCountryList() {
        
    }
}
