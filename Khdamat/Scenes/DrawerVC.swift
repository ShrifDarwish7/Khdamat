//
//  DrawerVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit

class DrawerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logout(_ sender: Any) {
        APIServices.shared.isLogged = false
        Router.toSignin(sender: self)
    }

}
