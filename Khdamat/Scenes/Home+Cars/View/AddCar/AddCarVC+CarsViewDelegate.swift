//
//  AddCarVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation
import SVProgressHUD

extension AddCarVC: CarsViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteAddCar(_ error: String?, _ message: String?) {
        if let error = error{
            self.showToast(message: error)
        }else if let message = message{
            self.showToast(message: message)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
}
