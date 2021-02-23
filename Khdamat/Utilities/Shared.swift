//
//  Shared.swift
//  Khdamat
//
//  Created by Sherif Darwish on 16/02/2021.
//

import Foundation
import CoreLocation

class Shared{
    static let errorMsg = "An error occuered, please try again later".localized
    static let headers = [
        "Authorization": "Bearer " + (APIServices.shared.user?.result?.accessToken ?? ""),
        "Accept": "application/json"
    ]
        
    static var fromLat: CLLocationDegrees?
    static var fromLng: CLLocationDegrees?
    static var toLat: CLLocationDegrees?
    static var toLng: CLLocationDegrees?
    static var mapState: MapState?
    static var fromAddress: Address?
    static var toAddress: Address?
    static var selectedServices: SelectedService?
}

enum MapState{
    case from
    case to
}

enum SelectedService{
    case renting
    case selling
    case maintain
    case wash
    case parts
    case road
}
