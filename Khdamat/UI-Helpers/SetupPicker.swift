//
//  SetupPicker.swift
//  TheBest-iOS
//
//  Created by Sherif Darwish on 8/2/20.
//  Copyright © 2020 Sherif Darwish. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupPicker(textField : UITextField , picker : UIPickerView){

        picker.reloadAllComponents()
        textField.inputView = picker
        
        let icon = UIImageView(frame : CGRect(x: 5, y: 5, width: 15, height: 15))
        icon.image = UIImage(named: "drop-down-arrow")
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textField.rightViewMode = .always
        textField.rightView = icon
    }
    
    @objc func dismissPick(){
        view.endEditing(true)
    }
}
