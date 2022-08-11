//
//  MainNavigationController.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift

protocol MainFactory: MovieDetailsFactory {
    func makeMoviesViewController() -> MoviesViewController
}

protocol MovieDetailsFactory {
    func makeMovieDetailsViewController(with movie: Movie) -> MovieDetailsViewController
}

class MainNavigationController: NiblessNavigationController {
    
    private let _disposeBag = DisposeBag()
    private let _viewModel: MainViewModel
    
    private let _viewControllersFactory: MainFactory
    
    // MARK: - Methods
    init(viewModel: MainViewModel, viewControllersFactory: MainFactory) {
        _viewModel = viewModel
        _viewControllersFactory = viewControllersFactory
        super.init()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }
    
    private func observeViewModel() {
        let observable = _viewModel.view.distinctUntilChanged()
        subscribe(to: observable)
    }
    
    private func subscribe(to observable: Observable<MainNavigationAction>){
        observable
            .subscribe(onNext: { [weak self] action in
                guard let strongSelf = self else { return }
                strongSelf.respond(to: action)
            }).disposed(by: self._disposeBag)
    }
    
    func respond(to navigationAction: MainNavigationAction) {
      switch navigationAction {
      case .present(let view):
        present(view)
      default:
          return
      }
    }
    
    private func present(_ view: MainView) {
        switch view {
        case .home:
            presentHome()
        }
    }
    
    private func presentHome() {
        print("🏡 Home")
        self.pushViewController(self._viewControllersFactory.makeMoviesViewController(), animated: true)
    }
}
