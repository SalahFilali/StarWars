//
//  StarWarsMoviesRepository.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

class StarWarsMoviesRepository: MoviesRepository {
    
    private let _networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        _networkManager = networkManager
    }
    
    func getAll() -> Single<[Movie]> {
        return _networkManager
            .defaultDataTask(withRouter: APIRouter.movies, forType: PageResponse<Movie>.self)
            .map({$0.results})
    }
}
