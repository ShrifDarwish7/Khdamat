//
//  ForgotPassVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import UIKit

class ForgotPassVC: UIViewController {

    @IBOutlet weak var newPass: CustomTFs!
    @IBOutlet weak var passTF: CustomTFs!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newPass.setAsPasswordField()
        passTF.setAsPasswordField()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
