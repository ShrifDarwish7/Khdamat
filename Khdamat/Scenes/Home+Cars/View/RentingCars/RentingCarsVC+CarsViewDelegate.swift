//
//  RentingCarsVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import SVProgressHUD

extension RentingCarsVC: CarsViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteGetRentalCars(_ data: RentalCars?, _ error: String?) {
        if let _ = data{
            self.cars = data?.data
            self.assetBaseUrl = data?.imageURL
            self.loadCollection()
        }else if let error = error{
            self.showToast(message: error)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
}
