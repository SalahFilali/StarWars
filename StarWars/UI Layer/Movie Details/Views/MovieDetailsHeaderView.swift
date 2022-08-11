//
//  MovieDetailsHeaderView.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift

class MovieDetaillsHeaderView: NiblessView {
    
    private let _disposeBag = DisposeBag()
    private var _hierarchyNotReady = true
    
    private let _viewModel: MovieDetailsViewModel
    
    private let _titleLabel: CommonLabel = {
        let label = CommonLabel(fontSize: 24)
        label.numberOfLines = 0
        return label
    }()
    private let _openingLabel: CommonLabel = {
        let label = CommonLabel(fontSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    let _releaseDateStack = CustomStack(valueLabel: CommonLabel(fontSize: 13), titleLabel: CommonLabel(withStaticText: Strings.ReleaseDate.title))
    let _directorStack = CustomStack(valueLabel: CommonLabel(fontSize: 13, numberOfLines: 0), titleLabel: CommonLabel(withStaticText: Strings.Director.title))
    let _producerStack = CustomStack(valueLabel: CommonLabel(fontSize: 13, numberOfLines: 0), titleLabel: CommonLabel(withStaticText: Strings.Producer.title))
    
    private lazy var _bottomStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_releaseDateStack, _directorStack, _producerStack])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .firstBaseline
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var _contentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_titleLabel, _bottomStack])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 30
        return stackView
    }()
    
    init(frame: CGRect = .zero, viewModel: MovieDetailsViewModel) {
        _viewModel = viewModel
        super.init(frame: frame)
    }
    
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard _hierarchyNotReady else { return }
        
        constructHierarchy()
        activateConstraints()
        backgroundColor = .black
        rxBinding()
        
        _hierarchyNotReady = false
    }
    
    private func constructHierarchy() {
        addSubview(_contentStack)
    }
    
    private func activateConstraints() {
        _contentStack.fillInParentSafeArea(insetByVertical: 20, horizontal: 14)
    }
}

//MARK: - Rx
extension MovieDetaillsHeaderView {
    
    private func rxBinding() {
        _viewModel
            .movie
            .map({$0.title})
            .bind(to: _titleLabel.rx.text)
            .disposed(by: _disposeBag)
        _viewModel
            .movie
            .map({$0.producer})
            .bind(onNext: _producerStack.setValue)
            .disposed(by: _disposeBag)
        _viewModel
            .movie
            .map({$0.director})
            .bind(onNext: _directorStack.setValue)
            .disposed(by: _disposeBag)
        _viewModel
            .movie
            .map({$0.release})
            .bind(onNext: _releaseDateStack.setValue)
            .disposed(by: _disposeBag)
    }
}
