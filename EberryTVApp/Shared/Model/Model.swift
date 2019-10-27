//
//  Model.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//
import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let score: Double
    let show: Show
}

// MARK: - Show
struct Show: Codable {
    let id: Int
    let url: String
    let name: String
    let type: TypeEnum
    let language: Language
    let genres: [String]
    let status: Status
    let runtime: Int
    let premiered: String?
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network, webChannel: Network?
    let externals: Externals
    let image: Image
    let summary: String?
    let updated: Int
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, premiered, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Externals
struct Externals: Codable {
    let tvrage, thetvdb: Int?
    let imdb: String?
}

// MARK: - Image
struct Image: Codable {
    let medium, original: String
}

enum Language: String, Codable {
    case english = "English"
    case japanese = "Japanese"
    case mongolian = "Mongolian"
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: Previousepisode
    let previousepisode: Previousepisode?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
    }
}

// MARK: - Previousepisode
struct Previousepisode: Codable {
    let href: String
}

// MARK: - Network
struct Network: Codable {
    let id: Int
    let name: String
    let country: Country
}

// MARK: - Country
struct Country: Codable {
    let name, code, timezone: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}

// MARK: - Schedule
struct Schedule: Codable {
    let time: String
    let days: [String]
}

enum Status: String, Codable {
    case ended = "Ended"
    case running = "Running"
}

enum TypeEnum: String, Codable {
    case reality = "Reality"
    case scripted = "Scripted"
}

typealias Welcome = [WelcomeElement]
