//
//  BaseViewModel.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

class BaseViewModel {

    lazy var _disposeBag = DisposeBag()

    // MARK: - Observables
    var loadingState: Observable<LoadingState> { return _loadingState.asObservable() }
    private let _loadingState = PublishSubject<LoadingState>()

    var alertConfig: Observable<AlertConfiguration> { return _alertConfig.asObservable() }
    private let _alertConfig = PublishSubject<AlertConfiguration>()

    init() {
    }
    
    func handle(error: Error) {
        switch error {
        case NetworkError.networkProblem:
            _alertConfig.onNext(.networkError())
        default:
            _alertConfig.onNext(.internalError())
        }
    }

    func showLoader() {
        _loadingState.onNext(.loading)
    }
    
    func hideLoader() {
        _loadingState.onNext(.none)
    }
    
    func showRefreshLoader() {
        _loadingState.onNext(.refreshLoading(true))
    }
    
    func hideRefreshLoader() {
        _loadingState.onNext(.refreshLoading(false))
    }
}
