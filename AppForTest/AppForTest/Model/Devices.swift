//
//  Mode.swift
//  AppForTest
//
//  Created by мас on 21.07.2022.
//

import Foundation

struct Devices: Codable {
    var devices: [Device]
    var user: User
    
}

struct Device: Codable {
    var id: Int
    var deviceName: String
    var intensity: Int?
    var mode: String?
    var temperature: Int?
    var position: Int?
    var productType: String
    
}

struct User: Codable {
    var firstName: String
    var lastName: String
    var address: Adress
    var birthDate: Int
}

struct Adress: Codable {
    var city: String
    var postalCode: Int
    var street: String
    var streetCode: String
    var country: String
    
}
