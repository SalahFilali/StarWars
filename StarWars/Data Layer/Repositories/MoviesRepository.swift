//
//  MoviesRepository.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation
import RxSwift

protocol MoviesRepository {
    
    func getAll() -> Single<[Movie]>
}
