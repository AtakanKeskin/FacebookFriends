//
//  FriendsModel.swift
//  FacebookFriends
//
//  Created by macbook on 7.11.2021.
//

import Foundation


struct Friends : Codable{
    let results : [Result]
}

struct Result: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let picture: Picture
    let nat: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

struct Location: Codable {
    let city, state, country: String
    let coordinates: Coordinates
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

struct Name: Codable {
    let title, first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}

