//
//  AdminModel.swift
//  SmartGig
//
//  Created by Jagadeesh on 30/01/23.
//

import Foundation

struct AdminModel: Codable {
    let msg, adminName: String
    let image: JSONNull?
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
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
