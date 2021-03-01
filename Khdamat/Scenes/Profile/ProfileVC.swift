//
//  ProfileVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 18/02/2021.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var name: CustomTFs!
    @IBOutlet weak var email: CustomTFs!
    @IBOutlet weak var phone: CustomTFs!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var emptyLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var carsPresenter: CarsPresenter?
    var myCars: [Car]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsPresenter = CarsPresenter(self)
        carsPresenter!.getMyCars()
        
        setupSWRevealVC()
        name.text = APIServices.shared.user?.result?.user.name
        email.text = APIServices.shared.user?.result?.user.email
        phone.text = APIServices.shared.user?.result?.user.phone

    }
    
    @IBAction func addNewCar(_ sender: Any) {
        carsPresenter?.getCarAtrributes()
    }
    
}
