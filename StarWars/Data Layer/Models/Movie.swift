//
//  Movie.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

struct Movie: Decodable {
    
    let title: String
    let episodeId: Int
    let openingCrawl, director, producer : String
    let created, edited, releaseDate: String
    let characters, planets, starships, vehicles, species: [URL]
    let url: URL
    var createdAt: String {
        get {
            return formatted(created, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        }
    }
    var editedAt: String {
        get {
            return formatted(edited, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        }
    }
    var release: String {
        get {
            return formatted(releaseDate, format: "yyyy-MM-dd")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case created
        case edited
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case url
    }
    
    private func formatted(_ string: String, format: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: string) else {
            fatalError("date format incorrect")
        }
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.locale = tempLocale
        return dateFormatter.string(from: date)
    }
    
}
