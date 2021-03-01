//
//  ChooseCarVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation
import SVProgressHUD

extension ChooseCarVC: CarsViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    
    func didCompletePostCarWashBook(_ data: BookingResponse?, _ error: String?) {
        if let data = data,
           let result = data.result{
            self.carPresenter?.getMyWashingBook(result.booking)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompletePostGarageBook(_ data: BookingResponse?, _ error: String?) {
        if let data = data,
           let result = data.result{
            self.carPresenter?.getMyGarageBook(result.booking)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompletePostRoadHelpBook(_ data: BookingResponse?, _ error: String?) {
        if let data = data,
           let result = data.result{
            self.carPresenter?.getMyRoadHelpBook(result.booking)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompletePostSparePartBook(_ data: BookingResponse?, _ error: String?) {
        if let data = data,
           let result = data.result{
            self.carPresenter?.getMySpareBook(result.booking)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompleteWithMySpareBook(_ data: MyBook?, _ error: String?) {
        if let data = data{
            Router.toFollowOrder(sender: self, bookData: nil, myBook: data)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompleteWithMyRoadBook(_ data: MyBook?, _ error: String?) {
        if let data = data{
            Router.toFollowOrder(sender: self, bookData: nil, myBook: data)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompleteWithMyWashingBook(_ data: MyBook?, _ error: String?) {
        if let data = data{
            Router.toFollowOrder(sender: self, bookData: nil, myBook: data)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompleteWithMyGarageBook(_ data: MyBook?, _ error: String?) {
        if let data = data{
            Router.toFollowOrder(sender: self, bookData: nil, myBook: data)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
}
