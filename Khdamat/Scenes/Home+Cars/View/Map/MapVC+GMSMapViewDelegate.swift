//
//  MapVC+GMSMapViewDelegate.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import Foundation
import GoogleMaps

extension MapVC: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        marker.alpha = 0.5
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("Projection",mapView.projection.coordinate(for: mapView.center))
        marker.alpha = 1
        
        let coordinates = mapView.projection.coordinate(for: mapView.center)
        switch Shared.mapState {
        case .from:
            Shared.fromLat = coordinates.latitude
            Shared.fromLng = coordinates.longitude
        case .to:
            Shared.toLat = coordinates.latitude
            Shared.toLng = coordinates.longitude
        default:
            break
        }
    }
}
