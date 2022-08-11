//
//  MovieDetailsViewController.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift
import RxCocoa

class MovieDetailsViewController: BaseNiblessViewController<MovieDetailsViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rxBinding()
        setBackButton()
    }
    
    private func setBackButton() {
        let backButton = UIButton()
        backButton.setTitle(Strings.BackButton.title, for: .normal)
        backButton.setImage(Assets.icBackArrow.image, for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        backButton.layer.masksToBounds = true
        backButton.addTarget(self, action: #selector(MovieDetailsViewController.dismissViewController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = MovieDetailsRootView(viewModel: _viewModel)
    }
}

//MARK: - Rx
extension MovieDetailsViewController {
    
    private func rxBinding() {
        bindTitle()
    }
    
    private func bindTitle() {
        _viewModel
            .movie
            .map({$0.title})
            .bind(onNext: setTitle)
            .disposed(by: _disposeBag)
    }
    
    private func setTitle(with string: String) {
        self.title = string
    }
}

