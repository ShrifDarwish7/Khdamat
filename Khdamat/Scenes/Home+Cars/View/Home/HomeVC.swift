//
//  HomeVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit
import SVProgressHUD

class HomeVC: UIViewController{

    @IBOutlet weak var blockView: UIView!
    @IBOutlet weak var dialogPosition: NSLayoutConstraint!
    @IBOutlet weak var dialogName: UILabel!
    @IBOutlet weak var dialogImage: UIImageView!
    @IBOutlet weak var rentalCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rentalStack: UIStackView!
    
    var carPeresenter: CarsPresenter!
    var cars: [Car]?
    var rentalCars: [Car]?
    var services: [Service]?
    var assetBaseUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carPeresenter = CarsPresenter(self)
        carPeresenter.getRentalCars()
        setupSWRevealVC()
        dialogPosition.constant = self.view.frame.height
        blockView.addTapGesture { (_) in
            self.dismissDialog()
        }
    }

    @IBAction func toRentingCars(_ sender: Any) {
        Shared.selectedServices = .renting
        Router.toRentingCars(sender: self)
    }
    
    @IBAction func showDialog(_ sender: UIButton) {
        switch sender.tag {
        case 2:
            Shared.selectedServices = .garage
            dialogImage.image = UIImage(named: "car_maintain")
            dialogName.text = "Car maintenance"
            skip.isHidden = true
        case 3:
            Shared.selectedServices = .wash
            dialogImage.image = UIImage(named: "car_wash")
            dialogName.text = "Car wash"
            skip.isHidden = true
        case 4:
            Shared.selectedServices = .road
            dialogImage.image = UIImage(named: "road_service")
            dialogName.text = "Road service"
            skip.isHidden = false
        case 5:
            Shared.selectedServices = .spareParts
            dialogImage.image = UIImage(named: "parts")
            dialogName.text = "Spare parts"
            skip.isHidden = false
        default:
            break
        }
        showDialog()
    }
    
    func showDialog(){
        blockView.isHidden = false
        self.dialogPosition.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
            self.view.layoutIfNeeded()
        } completion: { (_) in
            
        }
    }
    
    func dismissDialog(){
        self.blockView.isHidden = true
        self.dialogPosition.constant = self.view.frame.height
    }
    
    @IBAction func toAddCar(_ sender: Any) {
        carPeresenter.getCarAtrributes()
    }
    
    
    @IBAction func toChooseCar(_ sender: Any) {
        SVProgressHUD.show()
        carPeresenter.getMyCars()
    }
    
}


