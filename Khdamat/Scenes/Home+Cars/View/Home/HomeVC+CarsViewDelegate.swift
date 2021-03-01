//
//  HomeVC+CarsViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation
import SVProgressHUD

extension HomeVC: CarsViewDelegate{
    func showProgress() {
        SVProgressHUD.show()
    }
    func dismissProgress() {
        SVProgressHUD.dismiss()
    }
    func didCompleteWithCarAttributes(_ data: CarAttributes?, _ error: String?) {
        if let data = data{
            Router.toAddCar(sender: self, data)
        }else if let error = error{
            self.showToast(message: error)
        }else{
            self.showToast(message: Shared.errorMsg)
        }
    }
    func didCompleteWithMyCars(_ data: [Car]?, _ error: String?) {
        SVProgressHUD.dismiss()
        if let data = data{
            self.cars = data
            switch Shared.selectedServices {
            case .wash:
                carPeresenter.getServices()
            case .road:
                carPeresenter.getRoadHelpServices()
            case .garage:
                carPeresenter.getGarageServices()
            case .spareParts:
                Router.toChooseCar(sender: self, cars, nil)
            default:
                break
            }
        }
    }
    func didCompleteWithServices(_ data: [Service]?, _ error: String?) {
        if let data = data{
            self.services = data
            if let _ = cars, let _ = services{
                Router.toChooseCar(sender: self, cars, services)
            }
        }
    }
    func didCompleteWithRoadHelpServices(_ data: [Service]?, _ error: String?) {
        if let data = data{
            self.services = data
            if let _ = cars, let _ = services{
                Router.toChooseCar(sender: self, cars, services)
            }
        }
    }
    func didCompleteWithGarageServices(_ data: [Service]?, _ error: String?) {
        if let data = data{
            self.services = data
            if let _ = cars, let _ = services{
                Router.toChooseCar(sender: self, cars, services)
            }
        }
    }
    func didCompleteGetRentalCars(_ data: RentalCars?, _ error: String?) {
        if let _ = data{
            self.rentalCars = data?.data
            self.assetBaseUrl = data?.imageURL
         //   self.loadCollection()
            self.rentalCollectionHeight.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            UIView.animate(withDuration: 0.3) {
                self.rentalStack.isHidden = false
            }
        }else if let error = error{
            self.rentalStack.isHidden = true
            self.showToast(message: error)
        }else{
            self.rentalStack.isHidden = true
            self.showToast(message: Shared.errorMsg)
        }
    }
}
