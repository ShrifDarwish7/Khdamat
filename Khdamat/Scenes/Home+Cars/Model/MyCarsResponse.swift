//
//  MyCarsResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation

// MARK: - MyCarsResponse
struct MyCarsResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: MyCars

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct MyCars: Codable {
    let cars: [Car]
}
