//
//  LoginResponse.swift
//  Khdamat
//
//  Created by Sherif Darwish on 18/02/2021.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let errorFlag: Int
    let message: String
    let result: Result?

    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct Result: Codable {
    let accessToken, tokenType: String
    let user: User
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case user
        case expiresIn = "expires_in"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email, code, phone: String
    let emailVerifiedAt: String?
    let image, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, code, phone
        case emailVerifiedAt = "email_verified_at"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
