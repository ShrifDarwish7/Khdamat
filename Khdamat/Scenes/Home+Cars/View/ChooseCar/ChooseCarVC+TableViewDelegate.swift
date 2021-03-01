//
//  ChooseCarVC+TableViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation
import UIKit

extension ChooseCarVC: UITableViewDelegate, UITableViewDataSource{
    
    func loadFromNib(){
        let nib = UINib(nibName: "ChooserTableViewCell", bundle: nil)
        carsTableView.register(nib, forCellReuseIdentifier: "ChooserTableViewCell")
        
        carsTableView.delegate = self
        carsTableView.dataSource = self
        
        carsTableView.reloadData()
        
        if let _ = services{
            servicesTableView.register(nib, forCellReuseIdentifier: "ChooserTableViewCell")
            servicesTableView.delegate = self
            servicesTableView.dataSource = self
            servicesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case carsTableView:
            return self.cars!.count
        default:
            return self.services!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooserTableViewCell") as! ChooserTableViewCell
        switch tableView {
        case carsTableView:
            cell.name.text = "lang".localized == "en" ? "\(self.cars![indexPath.row].categoryObj.nameEn ) - \(self.cars![indexPath.row].brandObj.nameEn )" : "\(self.cars![indexPath.row].categoryObj.nameAr ) - \( self.cars![indexPath.row].brandObj.nameAr )"
            if self.cars?[indexPath.row].selected ?? false{
                cell.radioImg.image = UIImage(named: "checked")
            }else{
                cell.radioImg.image = UIImage(named: "unchecked")
            }
        default:
            cell.name.text = (("lang".localized == "en" ? self.services![indexPath.row].nameEn : self.services![indexPath.row].nameAr)!) + " " + (self.services![indexPath.row].price ?? "0") + " " + "KWT"
            if self.services?[indexPath.row].selected ?? false{
                cell.radioImg.image = UIImage(named: "checked")
            }else{
                cell.radioImg.image = UIImage(named: "unchecked")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case carsTableView:
            for i in 0...self.cars!.count-1{
                self.cars![i].selected = false
            }
            self.cars![indexPath.row].selected = !self.cars![indexPath.row].selected!
            self.selectedCar = self.cars![indexPath.row]
        default:
            for i in 0...self.services!.count-1{
                self.services![i].selected = false
            }
            self.services![indexPath.row].selected = !self.services![indexPath.row].selected!
            self.selectedServices = self.services![indexPath.row]
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
