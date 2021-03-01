//
//  MyBookResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 25/02/2021.
//

import Foundation

// MARK: - MyBookResponse
struct MyBookResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: MyBookResult

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct MyBookResult: Codable {
    let booking: MyBook
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case booking
        case imageURL = "image_url"
    }
}

// MARK: - Booking
struct MyBook: Codable {
    let id: Int
    let user, car, type, service: String
    let status, bookingDescription: String
    let long, lat: String?
    let createdAt, updatedAt: String
    let serviceObj: Service
    let carObj: Car

    enum CodingKeys: String, CodingKey {
        case id, user, car, type, service, status
        case bookingDescription = "description"
        case long, lat
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case serviceObj = "service_obj"
        case carObj = "car_obj"
    }
}
