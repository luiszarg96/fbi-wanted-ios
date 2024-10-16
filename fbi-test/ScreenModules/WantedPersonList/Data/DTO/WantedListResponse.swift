//
//  WantedListResponse.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation

struct WantedListResponse: Codable {
    let total: Int
    let items: [WantedPerson]
    let page: Int
}

// MARK: - Response
struct WantedPerson: Codable {
//    let ageMin: Int?
//    let path, remarks, eyes, status: String?
    let description: String?
    let aliases: [String]?
//    let rewardText: String?
//    let details: String?
//    let complexion: String?
//    let posterClassification, sex: String?
//    let warningMessage: String?
//    let additionalInformation: String?
//    let suspects: String?
//    let weightMax: Int?
    let title: String?
//    let rewardMin: Int?
//    let publication: String?
//    let rewardMax: Int?
//    let nationality: String?
//    let race: String?
//    let ncic: String?
//    let hair: String?
//    let caution: String?
    let images: [ImageResponse]?
//    let scarsAndMarks: String?
//    let personClassification: String?
//    let weight, uid: String?
//    let weightMin: Int?
//    let placeOfBirth: String?
//    let build: String?
//    let ageMax: Int?
//    let ageRange: String?
//    let heightMax: Int?
//    let raceRaw, eyesRaw: String?
//    let heightMin: Int?
//    let url: String?
//    let hairRaw: String?
//    let modified: Date?
//    let id: String?

    enum CodingKeys: String, CodingKey {
//        case ageMin = "age_min"
//        case path, remarks, eyes, status
        case description
        case aliases
//        case rewardText = "reward_text"
//        case details, complexion
//        case posterClassification = "poster_classification"
//        case sex
//        case warningMessage = "warning_message"
//        case additionalInformation = "additional_information"
//        case suspects
//        case weightMax = "weight_max"
        case title
//        case rewardMin = "reward_min"
//        case publication
//        case rewardMax = "reward_max"
//        case nationality, race, ncic, hair, caution
        case images
//        case scarsAndMarks = "scars_and_marks"
//        case personClassification = "person_classification"
//        case weight, uid
//        case weightMin = "weight_min"
//        case placeOfBirth = "place_of_birth"
//        case build
//        case ageMax = "age_max"
//        case ageRange = "age_range"
//        case heightMax = "height_max"
//        case raceRaw = "race_raw"
//        case eyesRaw = "eyes_raw"
//        case heightMin = "height_min"
//        case url
//        case hairRaw = "hair_raw"
//        case modified
//        case id = "@id"
    }
}


// MARK: - Image
struct ImageResponse: Codable {
    let caption: String?
    let large: String?
    let original: String?
    let thumb: String?
}
