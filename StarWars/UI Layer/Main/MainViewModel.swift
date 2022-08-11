//
//  MainViewModel.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

protocol MainNavigator {
    func goToHome()
}

class MainViewModel: MainNavigator {
    
    var view: Observable<MainNavigationAction> { return self._view.asObservable()}
    private let _view: BehaviorSubject<MainNavigationAction> = BehaviorSubject<MainNavigationAction>(value: .present(.home))
    
    init(){ }
    
    func goToHome() {
        self._view.onNext(.present(.home))
    }
}
