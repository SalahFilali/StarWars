//
//  MoviesViewController.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift

class MoviesViewController: BaseNiblessViewController<MoviesViewModel> {
    
    private let _detailsFactory: MovieDetailsFactory
    
    init(viewModel: MoviesViewModel, detailsFactory: MovieDetailsFactory) {
        _detailsFactory = detailsFactory
        super.init(viewModel: viewModel)
        self.title = Strings.MoviesScreen.title
    }
    
    override func loadView() {
        super.loadView()
        self.view = MoviesRootView(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rxBinding()
    }
}

//MARK: - Rx
extension MoviesViewController {
    
    private func rxBinding() {
        bindItemSelection()
        subscribeToAlertState()
    }
    
    private func bindItemSelection() {
        _viewModel
            .selectedItem
            .bind { [weak self] movie in
                guard let self = self else { return }
                let detailsViewController = self._detailsFactory.makeMovieDetailsViewController(with: movie)
                let navigationController = UINavigationController(rootViewController: detailsViewController)
                self.present(navigationController, animated: true, completion: nil)
            }.disposed(by: _disposeBag)
    }
}
