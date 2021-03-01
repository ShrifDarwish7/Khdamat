//
//  CarVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import UIKit
import Cosmos

class CarVC: UIViewController {

    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var fromTime: CustomTFs!
    @IBOutlet weak var toTime: CustomTFs!
    
    var assetBaseUrl: String?
    var receivedCar: Car?
    var carsPresenter: CarsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsPresenter = CarsPresenter(self)
        fromTime.makeDatePicker()
        toTime.makeDatePicker()
        
        carImg.sd_setImage(with: URL(string: assetBaseUrl! + "/" + (receivedCar!.image ?? ""))!)
        
        if "lang".localized == "en"{
            name.text = receivedCar!.brandObj.nameEn + " - " + receivedCar!.categoryObj.nameEn + " - " + receivedCar!.colorObj.nameEn
            desc.text = receivedCar!.descriptionEn
        }else{
            name.text = receivedCar!.brandObj.nameAr + " - " + receivedCar!.categoryObj.nameAr + " - " + receivedCar!.colorObj.nameAr
            desc.text = receivedCar!.descriptionAr
        }
        status.text = receivedCar!.status
        cost.text = receivedCar!.price
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toLocationFrom(_ sender: Any) {
        Shared.mapState = .from
        Router.toAddress(sender: self)
    }
    
    @IBAction func toLocationTo(_ sender: Any) {
        Shared.mapState = .to
        Router.toAddress(sender: self)
    }
    
    @IBAction func bookNow(_ sender: Any) {
//        print("coordsFrom: \(Shared.fromLat)-\(Shared.fromLng)")
//        print("addressFrom:",Shared.fromAddress)
//        print("coordsTo: \(Shared.toLat)-\(Shared.toLng)")
//        print("addressFrom:",Shared.toAddress)
        guard !fromTime.text!.isEmpty, !toTime.text!.isEmpty else {
            showToast(message: "Please enter booking time")
            return
        }
        let prms: [String: String] = [
            "from": String(fromTime.text!.split(separator: " ")[0]),
            "to": String(toTime.text!.split(separator: " ")[0]),
            "bookingTimeDelivery": String(fromTime.text!.split(separator: " ")[1]),
            "bookingTimeReturn": String(toTime.text!.split(separator: " ")[1])
        ]
        print(prms)
        carsPresenter?.rentalBooking(prms, receivedCar!.id)
    }
}
