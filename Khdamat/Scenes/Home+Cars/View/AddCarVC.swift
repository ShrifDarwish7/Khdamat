//
//  AddCarVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import UIKit

class AddCarVC: UIViewController {
    
    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var type: CustomTFs!
    @IBOutlet weak var category: CustomTFs!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch Shared.selectedServices {
        case .wash:
            titleTop.text = "Car wash"
        case .maintain:
        titleTop.text = "Car maintenance"
        case .road:
            titleTop.text = "Road service"
        case .parts:
            titleTop.text = "Spare parts"
        default:
            break
        }

    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
