//
//  ChooseCarVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import UIKit
import Closures

class ChooseCarVC: UIViewController {

    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var servicesTableView: UITableView!
    @IBOutlet weak var carsTableHeight: NSLayoutConstraint!
    @IBOutlet weak var servicesTableHeight: NSLayoutConstraint!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var serviceStack: UIStackView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var sparePartNameStack: UIStackView!
    @IBOutlet weak var sparePartNameTF: CustomTFs!
    @IBOutlet weak var sparePhotosStack: UIStackView!
    @IBOutlet weak var notesStack: UIStackView!
    
    var carPresenter: CarsPresenter?
    var cars: [Car]?
    var services: [Service]?
    var selectedCar: Car?
    var selectedServices: Service?
    var selectedImage1: UIImage?
    var selectedImage2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carPresenter = CarsPresenter(self)
        
        switch Shared.selectedServices {
        case .wash:
            titleTop.text = "Car wash"
        case .garage:
            titleTop.text = "Garage"
        case .road:
            titleTop.text = "Road service"
        case .spareParts:
            titleTop.text = "Spare parts"
            serviceStack.isHidden = true
            sparePhotosStack.isHidden = false
            sparePartNameStack.isHidden = false
            notesStack.isHidden = true
        default:
            break
        }
        
        image1.addTapGesture { (_) in
            let imagePicker = UIImagePickerController.init(source: .photoLibrary, allow: .image, showsCameraControls: true, didCancel: { (controller) in
                controller.dismiss(animated: true, completion: nil)
            }) { (result, controller) in
                controller.dismiss(animated: true, completion: nil)
                self.image1.image = result.originalImage
                self.selectedImage1 = result.originalImage
            }
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        image2.addTapGesture { (_) in
            let imagePicker = UIImagePickerController.init(source: .photoLibrary, allow: .image, showsCameraControls: true, didCancel: { (controller) in
                controller.dismiss(animated: true, completion: nil)
            }) { (result, controller) in
                controller.dismiss(animated: true, completion: nil)
                self.image2.image = result.originalImage
                self.selectedImage2 = result.originalImage
            }
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        loadFromNib()
        
        self.carsTableHeight.constant = self.carsTableView.contentSize.height + 20
        self.servicesTableHeight.constant = self.servicesTableView.contentSize.height + 20
        self.view.layoutIfNeeded()

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func chooseFromMap(_ sender: Any) {
        Shared.mapState = .from
        Router.toMap(sender: self)
    }
    
    @IBAction func submit(_ sender: Any) {
        var parameters: [String: String] = [
            "service": "\(self.selectedServices?.id ?? 0)",
            "car": "\(self.selectedServices?.id ?? 0)",
            "description": self.notes.text!,
            "lat": "\(Shared.fromLat ?? 0.0)",
            "lng": "\(Shared.fromLng ?? 0.0)"
        ]
        
        switch Shared.selectedServices {
        case .wash:
            carPresenter?.carWashBooking(parameters)
        case .road:
            carPresenter?.roadHelpBooking(parameters)
        case .garage:
            carPresenter?.postGarageBooking(parameters)
        case .spareParts:
            print("parameters",parameters)
            parameters.removeValue(forKey: "service")
            parameters.removeValue(forKey: "description")
            parameters.updateValue(sparePartNameTF.text!, forKey: "spare_part_name")
            let images: [String: UIImage] = [
                "spare_part_WordPad": selectedImage1 ?? UIImage(),
                "spare_part_photo": selectedImage2 ?? UIImage()
            ]
            carPresenter?.postSparePartBook(parameters, images)
        default:
            break
        }
    }
    
}
