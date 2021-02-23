//
//  RentingCarsVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import UIKit

class RentingCarsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var cars: [Car]?
    var assetBaseUrl: String?
    var carsPresnter: CarsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsPresnter = CarsPresenter(self)
        carsPresnter.getRentalCars()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
