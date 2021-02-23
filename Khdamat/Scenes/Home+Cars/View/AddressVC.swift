//
//  AddressVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import UIKit

class AddressVC: UIViewController {

    @IBOutlet weak var governTF: CustomTFs!
    @IBOutlet weak var regionTF: CustomTFs!
    @IBOutlet weak var pieceTF: CustomTFs!
    @IBOutlet weak var streetTF: CustomTFs!
    @IBOutlet weak var avenueTF: CustomTFs!
    @IBOutlet weak var gouseTF: CustomTFs!
    @IBOutlet weak var floorTF: CustomTFs!
    @IBOutlet weak var flatTF: CustomTFs!
    @IBOutlet weak var notesTF: CustomTFs!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseFromMap(_ sender: Any) {
        Router.toMap(sender: self)
    }
    
    @IBAction func save(_ sender: Any) {
        let address = Address(
            governorate: governTF.text!,
            region: regionTF.text!,
            piece: pieceTF.text!,
            street: streetTF.text!,
            avenue: avenueTF.text!,
            house: gouseTF.text!,
            floor: floorTF.text!,
            flat: flatTF.text!,
            notes: notesTF.text!)
        switch Shared.mapState {
        case .from:
            Shared.fromAddress = address
        case .to:
            Shared.toAddress = address
        default:
            break
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
