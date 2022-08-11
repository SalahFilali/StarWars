//
//  MoviesViewModel.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

class MoviesViewModel: BaseViewModel {
    
    private let _repository: MoviesRepository
    
    private let _items = BehaviorSubject<[Movie]>(value: [])
    var items: Observable<[Movie]> { return _items.asObservable() }
    
    let selectedItem = PublishSubject<Movie>()
    
    init(with repository: MoviesRepository) {
        _repository = repository
    }
    
    private func getMovies() {
        _repository
            .getAll()
            .subscribe {[weak self] movies in
                self?._items.onNext(movies)
            } onFailure: {[weak self] error in
                self?.handle(error: error)
            } onDisposed: {[weak self] in
                self?.hideLoader()
                self?.hideRefreshLoader()
            }.disposed(by: _disposeBag)
    }

    func loadMovies() {
        showLoader()
        getMovies()
    }
    
    @objc
    func refresh() {
        getMovies()
    }
    
    
}
