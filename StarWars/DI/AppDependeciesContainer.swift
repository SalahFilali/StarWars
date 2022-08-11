//
//  AppDependeciesContainer.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

class AppDependenciesContainer {
    
    //MARK: - Shared Dependencies
    let sharedViewModel: MainViewModel
    private let _networkManager: NetworkManager
    
    private lazy var _moviesRepository: MoviesRepository = {
        return StarWarsMoviesRepository(networkManager: _networkManager)
    }()
    
    //MARK: - Methods
    init() {
        sharedViewModel = MainViewModel()
        _networkManager = URLSessionNetworkManager()
    }
    
    func makeMainViewController() -> MainNavigationController {
        return MainNavigationController(viewModel: sharedViewModel, viewControllersFactory: self)
    }
    
    private func makeMoviesViewModel() -> MoviesViewModel {
        return MoviesViewModel(with: _moviesRepository)
    }
    
    private func makeMovieDetailsViewModel(with movie: Movie) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(with: movie)
    }
    
}

//MARK: - Main Factory Conformance
extension AppDependenciesContainer: MainFactory {
    
    func makeMoviesViewController() -> MoviesViewController {
        return MoviesViewController(viewModel: makeMoviesViewModel(), detailsFactory: self)
    }
    
    func makeMovieDetailsViewController(with movie: Movie) -> MovieDetailsViewController {
        return MovieDetailsViewController(viewModel: makeMovieDetailsViewModel(with: movie))
    }
}
