//
//  CarAttributesResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation

// MARK: - CarAttributesResponse
struct CarAttributesResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: CarAttributes

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct CarAttributes: Codable {
    let countries, brands, categories, colors: [CarAttribute]
    let years: Years
}

// MARK: - Brand
struct CarAttribute: Codable, ApiNameBase {
    var id: Int?
    var nameAr: String?
    var nameEn: String?
    let country: String?
    let createdAt, updatedAt: String?
    let brand: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nameEn = "name_en"
        case nameAr = "name_ar"
        case country
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case brand
    }
}

// MARK: - Years
struct Years: Codable {
    let start, end: String
}
