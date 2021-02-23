//
//  FollowOrderVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import UIKit

class FollowOrderVC: UIViewController {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var vehicleDetails: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var implementService: UILabel!
    
    var bookData: BookData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
