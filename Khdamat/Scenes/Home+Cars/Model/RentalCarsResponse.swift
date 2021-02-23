//
//  RentalCarsResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 19/02/2021.
//

import Foundation

// MARK: - RentalCarsResponse
struct RentalCarsResponse: Codable {
    let errorFlag: Int
    let message: String?
    let result: RentalCars

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct RentalCars: Codable {
    let data: [Car]
    let imageURL: String
    let pagination: Pagination

    enum CodingKeys: String, CodingKey {
        case data
        case imageURL = "image_url"
        case pagination
    }
}

// MARK: - Datum
struct Car: Codable {
    let id: Int
    let office, country, brand, category: String
    let color, year, image, price: String
    let descriptionEn, descriptionAr, num, status: String
    let createdAt, updatedAt: String
    let categoryObj, brandObj, colorObj: Obj

    enum CodingKeys: String, CodingKey {
        case id, office, country, brand, category, color, year, image, price
        case descriptionEn = "description_en"
        case descriptionAr = "description_ar"
        case num, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case categoryObj = "category_obj"
        case brandObj = "brand_obj"
        case colorObj = "color_obj"
    }
}

// MARK: - Obj
struct Obj: Codable {
    let id: Int
    let nameEn, nameAr: String
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

// MARK: - Pagination
struct Pagination: Codable {
    let total, count, perPage, currentPage: Int
    let totalPages: Int
    let prev, next: String?

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case prev, next
    }
}
