//
//  CarVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import Foundation
import SVProgressHUD

extension CarVC: CarsViewDelegate{
   
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteRentalBook(_ data: BookingResponse?, _ error: String?) {
        Router.toFollowOrder(sender: self, bookData: nil, myBook: nil)
        if let data = data{
            self.carsPresenter?.getRentalBook(data.result!.booking)
        }else if let error = error{
            self.showToast(message: error)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
    func didCompleteGetRentalBook(_ data: BookData?, _ error: String?) {
        if let data = data{
            Router.toFollowOrder(sender: self, bookData: data, myBook: nil)
        }else if let error = error{
            self.showToast(message: error)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
}
        
