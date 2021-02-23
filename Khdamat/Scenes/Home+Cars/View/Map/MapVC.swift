//
//  MapVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var marker: UIImageView!
    @IBOutlet weak var askLocationView: AskLocationView!
    
    let locationManager = CLLocationManager()
    var camera: GMSCameraPosition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        mapView.delegate = self
        requestLocationPermission()
        
        switch locationManager.authorizationStatus {
        case .notDetermined , .denied, .restricted:
            camera = GMSCameraPosition.camera(withLatitude: 30.0444, longitude: 31.2357, zoom: 10)
            mapView.camera = camera!
        default:
            break
        }

    }

    @IBAction func toMyLocation(_ sender: Any) {
        switch locationManager.authorizationStatus {
        case .notDetermined , .denied, .restricted:
            askLocationView.isHidden = false
        default:
            requestLocationPermission()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmPin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
