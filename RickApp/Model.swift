//
//  Model.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import Foundation

struct Model: Codable {
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let image: String
}

struct Origin: Codable {
    let name: String
}
