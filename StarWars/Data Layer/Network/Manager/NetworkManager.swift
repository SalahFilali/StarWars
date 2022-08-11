//
//  NetworkManager.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

protocol NetworkManager: CancellableTask {
    
    func defaultDataTask<T: Decodable>(withRouter router: Router, forType type: T.Type ) -> Single<T>
}

protocol CancellableTask {
    func cancelLastTask ()
}
