//
//  MovieCastModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieCastModel = try? newJSONDecoder().decode(MovieCastModel.self, from: jsonData)

import Foundation

// MARK: - MovieCastModel
struct MovieCastModel: Codable {
    let id: Int?
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let known_for_department: Department?
    let name, original_name: String?
    let popularity: Double?
    let profile_path: String?
    let cast_id: Int?
    let character, credit_id: String?
    let order: Int?
    let department: Department?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case known_for_department
        case name
        case original_name
        case popularity
        case profile_path
        case cast_id
        case character
        case credit_id
        case order, department, job
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
