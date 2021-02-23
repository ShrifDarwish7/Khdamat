//
//  BookingResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 20/02/2021.
//

import Foundation

struct BookingResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: BookResult?

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

struct BookResult: Codable {
    let status: String
    let booking: Int
}
