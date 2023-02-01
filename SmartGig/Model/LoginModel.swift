//
//  LoginModel.swift
//  SmartGig
//
//  Created by Jagadeesh on 27/01/23.
//

import Foundation

struct Login: Encodable {
    let email ,password: String
}

struct LoginModel: Codable {
    let msg, adminName: String
    let image: String
    let role: String
    let adminID: Int
    let isPasswordChanged: Bool
    let token: String

    enum CodingKeys: String, CodingKey {
        case msg, adminName, image, role
        case adminID = "adminId"
        case isPasswordChanged, token
    }
}
