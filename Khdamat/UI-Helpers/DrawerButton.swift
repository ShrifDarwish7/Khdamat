//
//  DrawerButton.swift
//  Khdamat
//
//  Created by Sherif Darwish on 17/02/2021.
//

import Foundation

class DrawerButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reload()
    }
    private func reload() {
//        self.parentContainerViewController()!.revealViewController()?.rearViewRevealWidth = self.parentContainerViewController()!.view.frame.width + 40
        self.parentContainerViewController()!.revealViewController()?.frontViewShadowOpacity = 2
        self.addTarget(self.parentContainerViewController()!.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
}

extension UIViewController{
    func setupSWRevealVC(){
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
    }
}
