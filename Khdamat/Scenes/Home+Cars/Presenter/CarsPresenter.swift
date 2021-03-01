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
    func didCompleteWithCarAttributes(_ data: CarAttributes?, _ error: String?)
    func didCompleteAddCar(_ error: String?, _ message: String?)
    func didCompleteWithServices(_ data: [Service]?, _ error: String?)
    func didCompleteWithMyCars(_ data: [Car]?, _ error: String?)
    func didCompletePostCarWashBook(_ data: BookingResponse?, _ error: String?)
    func didCompleteWithRoadHelpServices(_ data: [Service]?, _ error: String?)
    func didCompletePostRoadHelpBook(_ data: BookingResponse?, _ error: String?)
    func didCompleteGetRentalBook(_ data: BookData?, _ error: String?)
    func didCompleteWithMyRoadBook(_ data: MyBook?, _ error: String?)
    func didCompleteWithMyWashingBook(_ data: MyBook?, _ error: String?)
    func didCompleteWithGarageServices(_ data: [Service]?, _ error: String?)
    func didCompletePostGarageBook(_ data: BookingResponse?, _ error: String?)
    func didCompleteWithMyGarageBook(_ data: MyBook?, _ error: String?)
    func didCompletePostSparePartBook(_ data: BookingResponse?, _ error: String?)
    func didCompleteWithMySpareBook(_ data: MyBook?, _ error: String?)
}

extension CarsViewDelegate{
    //func showProgress(){}
    //func dismissProgress(){}
    func didCompleteGetRentalCars(_ data: RentalCars?, _ error: String?){}
    func didCompleteRentalBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteGetRentalBook(_ data: BookData?, _ error: String?){}
    func didCompleteWithCarAttributes(_ data: CarAttributes?, _ error: String?){}
    func didCompleteAddCar(_ error: String?, _ message: String?){}
    func didCompleteWithServices(_ data: [Service]?, _ error: String?){}
    func didCompleteWithMyCars(_ data: [Car]?, _ error: String?){}
    func didCompletePostCarWashBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteWithRoadHelpServices(_ data: [Service]?, _ error: String?){}
    func didCompletePostRoadHelpBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteWithMyRoadBook(_ data: MyBook?, _ error: String?){}
    func didCompleteWithMyWashingBook(_ data: MyBook?, _ error: String?){}
    func didCompleteWithGarageServices(_ data: [Service]?, _ error: String?){}
    func didCompletePostGarageBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteWithMyGarageBook(_ data: MyBook?, _ error: String?){}
    func didCompletePostSparePartBook(_ data: BookingResponse?, _ error: String?){}
    func didCompleteWithMySpareBook(_ data: MyBook?, _ error: String?){}
}

class CarsPresenter{
    var delegate: CarsViewDelegate?
    init(_ delegate: CarsViewDelegate) {
        self.delegate = delegate
    }
    func getMySpareBook(_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.getMySpareBook(id)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: MyBookResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithMySpareBook(model.result.booking, nil)
                }else{
                    self.delegate?.didCompleteWithMySpareBook(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithMySpareBook(nil, nil)
            }
        }
    }
    func postSparePartBook(_ prms: [String: String],_ images: [String: UIImage]){
        self.delegate?.showProgress()
        APIServices.shared.call(.postSparePartBook(prms, images)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: BookingResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompletePostSparePartBook(model,nil)
                }else{
                    self.delegate?.didCompletePostSparePartBook(nil,model.message)
                }
            }else{
                self.delegate?.didCompletePostSparePartBook(nil,nil)
            }
        }
    }
    func getMyGarageBook(_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.getMyGarageBook(id)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: MyBookResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithMyGarageBook(model.result.booking, nil)
                }else{
                    self.delegate?.didCompleteWithMyGarageBook(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithMyGarageBook(nil, nil)
            }
        }
    }
    func postGarageBooking(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.postGarageBook(prms)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: BookingResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompletePostGarageBook(model,nil)
                }else{
                    self.delegate?.didCompletePostGarageBook(nil,model.message)
                }
            }else{
                self.delegate?.didCompletePostGarageBook(nil,nil)
            }
        }
    }
    func getMyWashingBook(_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.getMyWashingBook(id)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: MyBookResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithMyWashingBook(model.result.booking, nil)
                }else{
                    self.delegate?.didCompleteWithMyWashingBook(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithMyWashingBook(nil, nil)
            }
        }
    }
    func getMyRoadHelpBook(_ id: Int){
        self.delegate?.showProgress()
        APIServices.shared.call(.getMyRoadHelpBook(id)) { (data) in
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: MyBookResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithMyRoadBook(model.result.booking, nil)
                }else{
                    self.delegate?.didCompleteWithMyRoadBook(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithMyRoadBook(nil, nil)
            }
        }
    }
    func getRentalCars(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getRentalCars) { (data) in
            //print(JSON(data!))
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
    func getCarAtrributes(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getCarAttributes) { (data) in
            self.delegate?.dismissProgress()
            print(JSON(data!))
            if let data = data,
               let model = data.getDecodedObject(from: CarAttributesResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithCarAttributes(model.result, nil)
                }else{
                    self.delegate?.didCompleteWithCarAttributes(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithCarAttributes(nil, nil)
            }
        }
    }
    func addCar(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.postCar(prms)) { (data) in
            self.delegate?.dismissProgress()
            print(JSON(data))
            if let data = data,
               let errorFlag = JSON(data)["error_flag"].int{
                if errorFlag == 0{
                    self.delegate?.didCompleteAddCar(nil, JSON(data)["message"].stringValue)
                }else{
                    self.delegate?.didCompleteAddCar(JSON(data)["message"].stringValue, nil)
                }
            }else{
                self.delegate?.didCompleteAddCar(nil, nil)
            }
        }
    }
    func getServices(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getServices) { (data) in
            print(JSON(data))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: ServicesResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithServices(model.result.services, nil)
                }else{
                    self.delegate?.didCompleteWithServices(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithServices(nil, nil)
            }
        }
    }
    func getGarageServices(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getGarageServices) { (data) in
            print(JSON(data))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: ServicesResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithGarageServices(model.result.services, nil)
                }else{
                    self.delegate?.didCompleteWithGarageServices(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithGarageServices(nil, nil)
            }
        }
    }
    func getRoadHelpServices(){
        self.delegate?.showProgress()
        APIServices.shared.call(.getRoadHelpServices) { (data) in
            print(JSON(data))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: ServicesResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithRoadHelpServices(model.result.services, nil)
                }else{
                    self.delegate?.didCompleteWithRoadHelpServices(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithRoadHelpServices(nil, nil)
            }
        }
    }
    func getMyCars(){
        //self.delegate?.showProgress()
        APIServices.shared.call(.getMyCars) { (data) in
            print(JSON(data))
          //  self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: MyCarsResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompleteWithMyCars(model.result.cars, nil)
                }else{
                    self.delegate?.didCompleteWithMyCars(nil, model.message)
                }
            }else{
                self.delegate?.didCompleteWithMyCars(nil, nil)
            }
        }
    }
    func carWashBooking(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.postCarWashBook(prms)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: BookingResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompletePostCarWashBook(model,nil)
                }else{
                    self.delegate?.didCompletePostCarWashBook(nil,model.message)
                }
            }else{
                self.delegate?.didCompletePostCarWashBook(nil,nil)
            }
        }
    }
    func roadHelpBooking(_ prms: [String: String]){
        self.delegate?.showProgress()
        APIServices.shared.call(.postRoadHelpBook(prms)) { (data) in
            print(JSON(data!))
            self.delegate?.dismissProgress()
            if let data = data,
               let model = data.getDecodedObject(from: BookingResponse.self){
                if model.errorFlag == 0{
                    self.delegate?.didCompletePostRoadHelpBook(model,nil)
                }else{
                    self.delegate?.didCompletePostRoadHelpBook(nil,model.message)
                }
            }else{
                self.delegate?.didCompletePostRoadHelpBook(nil,nil)
            }
        }
    }
}
