//
//  Entity.swift
//  Viper
//
//  Created by BJIT-SAKIB on 6/5/24.
//

import Foundation


// MARK: - Welcome4Element
struct Users:Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address:Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo:Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company:Codable {
    let name, catchPhrase, bs: String
}
