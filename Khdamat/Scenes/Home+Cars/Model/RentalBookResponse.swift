//
//  RentalBookREsponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import Foundation

// MARK: - RentalBookResponse
struct RentalBookResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: BookData

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct BookData: Codable {
    let booking: Book
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case booking
        case imageURL = "image_url"
    }
}

// MARK: - Booking
struct Book: Codable {
    let id: Int
    let requestType, requestDateFrom, requestDateTo, requestDatetimeStart: String
    let requestDatetimeBack, car, user, office: String
    let deliveryStatus: String
    let deliveryAddressLng, deliveryAddressLat, governorate, region: String?
    let piece, street, avenue, home: String?
    let notes, backDeliveryAddressLng, backDeliveryAddressLat, backGovernorate: String?
    let backRegion, backPiece, backStreet, backAvenue: String?
    let backHome, backNotes: String?
    let days, createdAt, updatedAt: String
    let rentalCarObj: Car

    enum CodingKeys: String, CodingKey {
        case id
        case requestType = "request_type"
        case requestDateFrom = "request_date_from"
        case requestDateTo = "request_date_to"
        case requestDatetimeStart = "request_datetime_start"
        case requestDatetimeBack = "request_datetime_back"
        case car, user, office
        case deliveryStatus = "delivery_status"
        case deliveryAddressLng = "delivery_address_lng"
        case deliveryAddressLat = "delivery_address_lat"
        case governorate = "Governorate"
        case region = "Region"
        case piece, street
        case avenue = "Avenue"
        case home = "Home"
        case notes = "Notes"
        case backDeliveryAddressLng = "back_delivery_address_lng"
        case backDeliveryAddressLat = "back_delivery_address_lat"
        case backGovernorate = "back_Governorate"
        case backRegion = "back_Region"
        case backPiece = "back_piece"
        case backStreet = "back_street"
        case backAvenue = "back_Avenue"
        case backHome = "back_Home"
        case backNotes = "back_Notes"
        case days
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case rentalCarObj = "rental_car_obj"
    }
}


