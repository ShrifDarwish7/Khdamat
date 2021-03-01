//
//  AddCarVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import UIKit

class AddCarVC: UIViewController {
    
    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var countries: CustomTFs!
    @IBOutlet weak var brands: CustomTFs!
    @IBOutlet weak var categories: CustomTFs!
    @IBOutlet weak var colors: CustomTFs!
    @IBOutlet weak var years: CustomTFs!

    var attributes: CarAttributes?
    
    let countriesPicker = UIPickerView()
    let brandsPicker = UIPickerView()
    let categoriesPicker = UIPickerView()
    let colorsPicker = UIPickerView()
    let yearsPicker = UIPickerView()
    
    var selectedCountry: CarAttribute?
    var selectedBrand: CarAttribute?
    var selectedCategory: CarAttribute?
    var selectedColor: CarAttribute?
    var selectedYear: String?
    
    var yearsList: [String]?
    
    var carPresenter: CarsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carPresenter = CarsPresenter(self)
        
        yearsList = (Int((attributes?.years.start)!)!...Int((attributes?.years.end)!)!).map({String($0)})
        
        countries.becomeFirstResponder()
        
        selectedCountry = attributes?.countries.first
        selectedBrand = attributes?.brands.first
        selectedCategory = attributes?.categories.first
        selectedColor = attributes?.colors.first
        selectedYear = yearsList?.first
        
        countries.text = "lang".localized == "en" ? attributes?.countries.first?.nameEn : attributes?.countries.first?.nameAr
        brands.text = "lang".localized == "en" ? attributes?.brands.first?.nameEn : attributes?.brands.first?.nameAr
        categories.text = "lang".localized == "en" ? attributes?.categories.first?.nameEn : attributes?.categories.first?.nameAr
        colors.text = "lang".localized == "en" ? attributes?.colors.first?.nameEn : attributes?.colors.first?.nameAr
        years.text = yearsList?.first
        
        switch Shared.selectedServices {
        case .wash:
            titleTop.text = "Car wash"
        case .garage:
        titleTop.text = "Garage"
        case .road:
            titleTop.text = "Road service"
        case .spareParts:
            titleTop.text = "Spare parts"
        default:
            break
        }

        setupPicker(textField: countries, picker: countriesPicker)
        setupPicker(textField: brands, picker: brandsPicker)
        setupPicker(textField: categories, picker: categoriesPicker)
        setupPicker(textField: colors, picker: colorsPicker)
        setupPicker(textField: years, picker: yearsPicker)
        
        countriesPicker.numberOfRowsInComponent { (_) -> Int in
            return (self.attributes?.countries.count)!
        }.titleForRow { (row, _) -> String? in
            return "lang".localized == "en" ? self.attributes?.countries[row].nameEn : self.attributes?.countries[row].nameAr
        }.didSelectRow { (row, _) in
            self.countries.text = "lang".localized == "en" ? self.attributes?.countries[row].nameEn : self.attributes?.countries[row].nameAr
            self.selectedCountry = self.attributes?.countries[row]
        }
        
        brandsPicker.numberOfRowsInComponent { (_) -> Int in
            return (self.attributes?.brands.count)!
        }.titleForRow { (row, _) -> String? in
            return "lang".localized == "en" ? self.attributes?.brands[row].nameEn : self.attributes?.brands[row].nameAr
        }.didSelectRow { (row, _) in
            self.brands.text = "lang".localized == "en" ? self.attributes?.brands[row].nameEn : self.attributes?.brands[row].nameAr
            self.selectedBrand = self.attributes?.brands[row]
        }
        
        categoriesPicker.numberOfRowsInComponent { (_) -> Int in
            return (self.attributes?.categories.count)!
        }.titleForRow { (row, _) -> String? in
            return "lang".localized == "en" ? self.attributes?.categories[row].nameEn : self.attributes?.categories[row].nameAr
        }.didSelectRow { (row, _) in
            self.categories.text = "lang".localized == "en" ? self.attributes?.categories[row].nameEn : self.attributes?.categories[row].nameAr
            self.selectedCategory = self.attributes?.categories[row]
        }
        
        colorsPicker.numberOfRowsInComponent { (_) -> Int in
            return (self.attributes?.colors.count)!
        }.titleForRow { (row, _) -> String? in
            return "lang".localized == "en" ? self.attributes?.colors[row].nameEn : self.attributes?.colors[row].nameAr
        }.didSelectRow { (row, _) in
            self.colors.text = "lang".localized == "en" ? self.attributes?.colors[row].nameEn : self.attributes?.colors[row].nameAr
            self.selectedColor = self.attributes?.colors[row]
        }
        
        yearsPicker.numberOfRowsInComponent { (_) -> Int in
            return self.yearsList!.count
        }.titleForRow { (row, _) -> String? in
            return self.yearsList![row]
        }.didSelectRow { (row, _) in
            self.years.text = self.yearsList![row]
            self.selectedYear = self.yearsList![row]
        }
        
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        
        let parameters: [String: String] = [
            "country": "\(self.selectedCountry?.id ?? 0)",
            "brand": "\(self.selectedBrand?.id ?? 0)",
            "category": "\(self.selectedCategory?.id ?? 0)",
            "year": "\(self.selectedYear ?? "")",
            "color": "\(self.selectedColor?.id ?? 0)"
        ]
        print(parameters)
        carPresenter?.addCar(parameters)
    }
}
