//
//  MapVC+CLLocationManagerDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation
import CoreLocation
import GoogleMaps

extension MapVC: CLLocationManagerDelegate{
    func requestLocationPermission(){
        
        locationManager.requestAlwaysAuthorization()
            
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }else{
            camera = GMSCameraPosition.camera(withLatitude: 30.0444 , longitude: 31.2357, zoom: 10)
            mapView.camera = camera!
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        switch Shared.mapState {
        case .from:
            Shared.fromLat = locValue.latitude
            Shared.fromLng = locValue.longitude
            camera = GMSCameraPosition.camera(withLatitude: Shared.fromLat ?? 0 , longitude: Shared.fromLng ?? 0, zoom: 19)
        case .to:
            Shared.toLat = locValue.latitude
            Shared.toLng = locValue.longitude
            camera = GMSCameraPosition.camera(withLatitude: Shared.toLat ?? 0 , longitude: Shared.toLng ?? 0, zoom: 19)
        default:
            break
        }
        mapView.camera = camera!
        locationManager.stopUpdatingLocation()
        
    }
}
