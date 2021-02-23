//
//  AuthPresenter.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation

protocol AuthViewDelegate {
    func showProgress()
    func dismissProgress()
    func didCompleteLoginWith(_ data: LoginResponse?,_ error: String?)
    func didCompleteSignUp(_ data: LoginResponse?,_ error: String?)
    func didCompleteVerifyAccount(_ error: String?)
}

extension AuthViewDelegate{
    func showProgress(){}
    func dismissProgress(){}
    func didCompleteLoginWith(_ data: LoginResponse?,_ error: String?){}
    func didCompleteSignUp(_ data: LoginResponse?,_ error: String?){}
    func didCompleteVerifyAccount(_ error: String?){}
}

class AuthPresenter{
    var delegate: AuthViewDelegate?
    init(_ delegate: AuthViewDelegate) {
        self.delegate = delegate
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
