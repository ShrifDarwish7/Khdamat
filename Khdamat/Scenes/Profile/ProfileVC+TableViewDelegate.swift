//
//  ProfileVC+TableViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation
import UIKit

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func loadCarsTable(){
        let nib = UINib(nibName: "MyCarsTableViewCell", bundle: nil)
        self.carsTableView.register(nib, forCellReuseIdentifier: "MyCarsTableViewCell")
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        self.carsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myCars!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.carsTableView.dequeueReusableCell(withIdentifier: "MyCarsTableViewCell", for: indexPath) as! MyCarsTableViewCell
        cell.carName.text = "lang".localized == "en" ? self.myCars![indexPath.row].categoryObj.nameEn + " - " + self.myCars![indexPath.row].brandObj.nameEn + " - " + self.myCars![indexPath.row].colorObj.nameEn : self.myCars![indexPath.row].categoryObj.nameAr + " - " + self.myCars![indexPath.row].brandObj.nameAr + " - " + self.myCars![indexPath.row].colorObj.nameAr
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
