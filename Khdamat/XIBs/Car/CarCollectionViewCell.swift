//
//  CarCollectionViewCell.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import UIKit
import Cosmos
import SDWebImage

class CarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var state: UILabel!
    
    func loadFrom(_ data: Car, _ base: String){
        carImg.sd_setImage(with: URL(string: base + "/" + data.image!)!)
        if "lang".localized == "en"{
            name.text = data.brandObj.nameEn + " - " + data.categoryObj.nameEn + " - " + data.colorObj.nameEn
            desc.text = data.descriptionEn
        }else{
            name.text = data.brandObj.nameAr + " - " + data.categoryObj.nameAr + " - " + data.colorObj.nameAr
            desc.text = data.descriptionAr
        }
        carImg.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 10)
        state.text = data.status
        cost.text = data.price
    }

}
