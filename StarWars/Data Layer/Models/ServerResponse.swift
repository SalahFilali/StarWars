//
//  ServerResponse.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

struct PageResponse<T:Decodable>: Decodable {
    let count: Int
    let next, previous: String?
    let results: [T]
}
