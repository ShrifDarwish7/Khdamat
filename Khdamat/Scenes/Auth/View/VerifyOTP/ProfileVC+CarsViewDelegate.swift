//
//  ProfileVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation
import SVProgressHUD

extension ProfileVC: CarsViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    
    func didCompleteWithMyCars(_ data: [Car]?, _ error: String?) {
        self.activityIndicator.stopAnimating()
        if let data = data{
            self.myCars = data
            if self.myCars!.isEmpty{
                self.emptyLbl.isHidden = false
                self.carsTableView.isHidden = true
            }else{
                self.emptyLbl.isHidden = true
                self.carsTableView.isHidden = false
                self.loadCarsTable()
                self.tableViewHeight.constant = self.carsTableView.contentSize.height + 20
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
        }else if let error = error{
            self.emptyLbl.isHidden = false
            self.carsTableView.isHidden = true
            showToast(message: error)
        }else{
            self.emptyLbl.isHidden = false
            self.carsTableView.isHidden = true
            showToast(message: Shared.errorMsg)
        }
    }
    
    func didCompleteWithCarAttributes(_ data: CarAttributes?, _ error: String?) {
        if let data = data{
            Router.toAddCar(sender: self, data)
        }else if let error = error{
            showToast(message: error)
        }else{
            showToast(message: Shared.errorMsg)
        }
    }
    
}
