//
//  AuthPresenter.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import SwiftyJSON

protocol AuthViewDelegate {
    func showProgress()
    func dismissProgress()
    func didCompleteLoginWith(_ data: LoginResponse?,_ error: String?)
    func didCompleteSignUp(_ data: LoginResponse?,_ error: String?)
    func didCompleteVerifyAccount(_ error: String?)
    func didCompleteForgetPassword(_ error: String?)
    func didCompleteResendOtp(_ error: String?)
    func didCompeleteVerifyOtp(_ error: String?)
    func didCompleteWithNewPassword(_ error: String?)
}

extension AuthViewDelegate{
    func didCompleteLoginWith(_ data: LoginResponse?,_ error: String?){}
    func didCompleteSignUp(_ data: LoginResponse?,_ error: String?){}
    func didCompleteVerifyAccount(_ error: String?){}
    func didCompleteForgetPassword(_ error: String?){}
    func didCompleteResendOtp(_ error: String?){}
    func didCompeleteVerifyOtp(_ error: String?){}
    func didCompleteWithNewPassword(_ error: String?){}
}

class AuthPresenter{
    var delegate: AuthViewDelegate?
    init(_ delegate: AuthViewDelegate) {
        self.delegate = delegate
    }
    func verifyAccount(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.verifyAccount(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data{
                do{
                    let json = try JSON(data: data)
                    if json["error_flag"].intValue == 0{
                        self.delegate?.didCompleteVerifyAccount(nil)
                    }else{
                        self.delegate?.didCompleteVerifyAccount(json["result"]["message"].stringValue)
                    }
                    
                }catch{
                    self.delegate?.didCompleteVerifyAccount(Shared.errorMsg)
                }
            }else{
                self.delegate?.didCompleteVerifyAccount(Shared.errorMsg)
            }
        }
    }
    func setNewPassword(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.newPasswordWithForget(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data{
                do{
                    let json = try JSON(data: data)
                    if json["error_flag"].intValue == 0{
                        self.delegate?.didCompleteWithNewPassword(nil)
                    }else{
                        self.delegate?.didCompleteWithNewPassword(json["result"]["message"].stringValue)
                    }
                    
                }catch{
                    self.delegate?.didCompleteWithNewPassword(Shared.errorMsg)
                }
            }else{
                self.delegate?.didCompleteWithNewPassword(Shared.errorMsg)
            }
        }
    }
    func verifyOtp(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.verifyOtpForget(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data{
                do{
                    let json = try JSON(data: data)
                    if json["error_flag"].intValue == 0{
                        self.delegate?.didCompeleteVerifyOtp(nil)
                    }else{
                        self.delegate?.didCompeleteVerifyOtp(json["result"]["message"].stringValue)
                    }
                    
                }catch{
                    self.delegate?.didCompeleteVerifyOtp(Shared.errorMsg)
                }
            }else{
                self.delegate?.didCompeleteVerifyOtp(Shared.errorMsg)
            }
        }
    }
    func resendOTP(){
        self.delegate?.showProgress()
        APIServices.shared.call(.resendOTP) { (data) in
            self.delegate?.dismissProgress()
            if let data = data{
                do{
                    let json = try JSON(data: data)
                    if json["error_flag"].intValue == 0{
                        self.delegate?.didCompleteResendOtp(nil)
                    }else{
                        self.delegate?.didCompleteResendOtp(json["result"]["message"].stringValue)
                    }
                    
                }catch{
                    self.delegate?.didCompleteResendOtp(Shared.errorMsg)
                }
            }else{
                self.delegate?.didCompleteResendOtp(Shared.errorMsg)
            }
        }
    }
    func forgetPassword(_ prms: [String:String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.forgotPassword(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data{
                do{
                    let json = try JSON(data: data)
                    if json["error_flag"].intValue == 0{
                        self.delegate?.didCompleteForgetPassword(nil)
                    }else{
                        self.delegate?.didCompleteForgetPassword(json["result"]["message"].stringValue)
                    }
                    
                }catch{
                    self.delegate?.didCompleteForgetPassword(Shared.errorMsg)
                }
            }else{
                self.delegate?.didCompleteForgetPassword(Shared.errorMsg)
            }
        }
    }
    func login(_ prms: [String:String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.login(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: LoginResponse.self){
                if model.errorFlag == 0{
                    APIServices.shared.user = model
                    APIServices.shared.isLogged = true
                    Shared.headers = [
                        "Authorization": "Bearer " + (APIServices.shared.user?.result?.accessToken ?? ""),
                        "Accept": "application/json"
                    ]
                    self.delegate?.didCompleteLoginWith(model,nil)
                }else{
                    self.delegate?.didCompleteLoginWith(nil,model.message)
                }
            }else{
                self.delegate?.didCompleteLoginWith(nil,nil)
            }
        }
    }
    func signup(_ prms: [String:String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.signup(prms)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: LoginResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteSignUp(model,nil)
                }else{
                    self.delegate?.didCompleteSignUp(nil,model.message)
                }
            }else{
                self.delegate?.didCompleteSignUp(nil,nil)
            }
        }
    }
}
