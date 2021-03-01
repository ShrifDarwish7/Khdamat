//
//  Protocols.swift
//  Khdamat
//
//  Created by Sherif Darwish on 23/02/2021.
//

import Foundation

protocol ApiNameBase: Codable {
    var id: Int? { get }
    var nameAr: String? { get }
    var nameEn: String? { get }
    var createdAt: String? { get }
    var updatedAt: String? { get }
    
    //    enum CodingKeys: String, CodingKey{
//        case id
//        case nameAr = "name_ar"
//        case nameEn = "name_en"
//    }
}
protocol ApiBase {
    var errorFlag: Int? { get }
    var message: String? { get }
}
