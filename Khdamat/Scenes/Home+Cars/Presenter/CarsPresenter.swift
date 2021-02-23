//
//  CarsPresenter.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import SwiftyJSON

protocol CarsViewDelegate {
    func showProgress()
    func dismissProgress()
    func didCompleteGetRentalCars(_ data: RentalCars?, _ error: String?)
    func didCompleteRentalBook(_ data: BookingResponse?, _ error: String?)
    func didCompleteGetRentalBook(_ data: BookData?, _ error: String?)
}

extension CarsViewDelegate{
    func showProgress(){}
    func dismissProgress(){}
    func didCompleteGetRentalCars(_ data: RentalCars?, _ error: String?){}
    func didCompleteRentalBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteGetRentalBook(_ data: BookData?, _ error: String?){}
}

class CarsPresenter{
    var delegate: CarsViewDelegate?
    init(_ delegate: CarsViewDelegate) {
        self.delegate = delegate
    }
    func getRentalCars(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getRentalCars) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: RentalCarsResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteGetRentalCars(model.result,nil)
                }else{
                    self.delegate?.didCompleteGetRentalCars(nil,model.message)
                }
            }else{
                self.delegate?.didCompleteGetRentalCars(nil,nil)
            }
        }
    }
    func rentalBooking(_ prms: [String: String],_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.rentalBookPost(prms, id)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: BookingResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteRentalBook(model,nil)
                }else{
                    self.delegate?.didCompleteRentalBook(nil,model.message)
                }
            }else{
                self.delegate?.didCompleteRentalBook(nil,nil)
            }
        }
    }
    func getRentalBook(_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.rentalBookGet(id)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: RentalBookResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteGetRentalBook(model.result, nil)
                }else{
                    self.delegate?.didCompleteGetRentalBook(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteGetRentalBook(nil, nil)
            }
        }
    }
}
