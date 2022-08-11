//
//  MovieDetailsViewModel.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

class MovieDetailsViewModel: BaseViewModel {
    
    private let _movie: BehaviorSubject<Movie>
    var movie: Observable<Movie> { return _movie}
    
    init(with movie: Movie) {
        _movie = BehaviorSubject(value: movie)
    }
}

