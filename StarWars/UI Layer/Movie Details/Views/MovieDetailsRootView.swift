//
//  MovieDetailsRootView.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift

class MovieDetailsRootView: NiblessView {
    
    private let _disposeBag = DisposeBag()
    private var _hierarchyNotReady = true
    
    private let _viewModel: MovieDetailsViewModel
    
    private lazy var _header = MovieDetaillsHeaderView(viewModel: _viewModel)
    
    private let _scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.insetsLayoutMarginsFromSafeArea = true
        scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        return scrollView
    }()
    
    private let _openingLabelTitle = CommonLabel(blackFontSize: 13, text: Strings.OpeningCraw.title)
    
    private let _openingLabelValue: CommonLabel = {
        let label = CommonLabel(blackFontSize: 13, text: "")
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var _mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_openingLabelTitle, _openingLabelValue])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 9
        return stackView
    }()
    
    private let _createdAtStack = CustomStack(
        valueLabel: CommonLabel(blackFontSize: 13, text: ""),
        titleLabel: CommonLabel(blackFontSize: 13, text: Strings.CreatedAt.title)
    )
    
    private let _editedAtStack =  CustomStack(
        valueLabel: CommonLabel(blackFontSize: 13, text: ""),
        titleLabel: CommonLabel(blackFontSize: 13, text: Strings.EditedAt.title)
    )
    
    private lazy var _footerStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_createdAtStack, _editedAtStack])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 13
        return stackView
    }()
    
    private lazy var _contentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_mainStack, _footerStack])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 20
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
        backgroundColor = .white
        rxBinding()
        _hierarchyNotReady = false
    }
    
    private func constructHierarchy() {
        addSubview(_header)
        addSubview(_scrollView)
        _scrollView.addSubview(_contentStack)
    }
    
    private func activateConstraints() {
        activateHeaderCnstraints()
        activateScrollViewConstraints()
        activateContentStackConstraints()
    }
    
    private func activateHeaderCnstraints() {
        _header.translatesAutoresizingMaskIntoConstraints = false
        _header.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        _header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        _header.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        _header.bottomAnchor.constraint(equalTo: _scrollView.topAnchor).isActive = true
    }
    
    private func activateScrollViewConstraints() {
        _scrollView.translatesAutoresizingMaskIntoConstraints = false
        _scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        _scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        _scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        _scrollView.contentInset = UIEdgeInsets(top: 10, left:14, bottom: 10, right: 14)
    }
    
    private func activateContentStackConstraints() {
        _contentStack.translatesAutoresizingMaskIntoConstraints = false
        _contentStack.leadingAnchor.constraint(equalTo: _scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        _contentStack.topAnchor.constraint(equalTo: _scrollView.contentLayoutGuide.topAnchor).isActive = true
        _contentStack.trailingAnchor.constraint(equalTo: _scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        _contentStack.bottomAnchor.constraint(equalTo: _scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        _contentStack.widthAnchor.constraint(equalTo: _scrollView.frameLayoutGuide.widthAnchor, constant: -28).isActive = true
    }
    
}

//MARK: - Rx
extension MovieDetailsRootView {
    
    private func rxBinding() {
        bindOpeningCrawl()
        bindDates()
    }
    
    private func bindOpeningCrawl() {
        _viewModel
            .movie
            .map({$0.openingCrawl})
            .bind(to: _openingLabelValue.rx.text)
            .disposed(by: _disposeBag)
    }
    
    private func bindDates() {
        _viewModel
            .movie
            .map({$0.createdAt})
            .bind(onNext: _createdAtStack.setValue)
            .disposed(by: _disposeBag)
        
        _viewModel
            .movie
            .map({$0.editedAt})
            .bind(onNext: _editedAtStack.setValue)
            .disposed(by: _disposeBag)
        
    }
}


