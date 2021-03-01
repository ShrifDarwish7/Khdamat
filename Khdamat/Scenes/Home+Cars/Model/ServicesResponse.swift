//
//  ServicesResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation

// MARK: - ServicesResponse
struct ServicesResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: Services

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct Services: Codable {
    let services: [Service]
}

// MARK: - Service
struct Service: Codable, ApiNameBase {
    
    var id: Int?
    
    var nameAr: String?
    
    var nameEn: String?
    
    var createdAt: String?
    
    var updatedAt: String?
    
    let price, status: String?
    
    var selected: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case nameEn = "name_en"
        case nameAr = "name_ar"
        case price, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
