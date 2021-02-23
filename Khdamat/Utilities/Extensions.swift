//
//  Extensions.swift
//  Khdamat
//
//  Created by Sherif Darwish on 16/02/2021.
//

import Foundation
import UIKit
import Toast_Swift
import Closures

extension String{
    var localized: String{
        return NSLocalizedString(self, comment: "")
    }
}

extension UIViewController {
    func showToast(message : String){
        self.view.makeToast(message, duration: 2, position: .bottom)
    }
    func setMenuButton(menuBtn : UIButton){
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 80
        self.revealViewController()?.frontViewShadowOpacity = 2
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
    }
}
extension UITextField{
    func setAsPasswordField(){
        self.isSecureTextEntry = true
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.height))
        button.addTarget(self, action: #selector(showPassword(sender:)), for: .touchUpInside)
        button.setImage(UIImage(named: "eye"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.rightView = button
        self.rightViewMode = .always
    }
    @objc func showPassword(sender: UIButton){
        guard !self.text!.isEmpty else {
            return
        }
        switch sender.tag {
        case 0:
            self.isSecureTextEntry = false
            sender.tag = 1
        default:
            self.isSecureTextEntry = true
            sender.tag = 0
        }
    }
    
    func makeDatePicker(){
        let dateFormatter = DateFormatter()
        let datePicker = UIDatePicker()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.locale = Locale.init(identifier: "EN")
        datePicker.datePickerMode = .dateAndTime
        self.inputView = datePicker
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.onChange { [self] (date) in
            self.text = dateFormatter.string(from: date)
        }
        let icon = UIImageView(frame : CGRect(x: 5, y: 5, width: 30, height: 15))
        icon.image = UIImage(named: "drop-down-arrow")
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.rightViewMode = .always
        self.rightView = icon
    }
}
