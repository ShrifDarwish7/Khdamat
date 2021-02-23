//
//  SplashVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 16/02/2021.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if APIServices.shared.isLogged{
            Router.toHome(sender: self)
        }else{
            Router.toGuide(sender: self)
        }
    }
    

}
