//
//  MoviesTableViewHeader.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift

class MoviesTableViewHeader: NiblessView {
    
    private var _hierarchyNotReady = true
    private let _disposeBag = DisposeBag()
    
    private let _countObservable: Observable<Int>
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: Assets.imgStarWars.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(countObservable: Observable<Int>) {
        _countObservable = countObservable
        super.init(frame: .zero)
    }
    
    private let countLabel = CommonLabel(fontSize: 15)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, countLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard _hierarchyNotReady else { return }
        
        constructHierarchy()
        activateConstraints()
        bindCount()
        backgroundColor = .black
        _hierarchyNotReady = false
    }
    
    private func constructHierarchy() {
        addSubview(stackView)
    }
    
    private func activateConstraints() {
        stackView.fillInParentSafeArea(insetByVertical: 10, horizontal: 10)
    }
    
    //MARK: - Rx
    private func bindCount() {
        _countObservable
            .bind(onNext: setCountLabel)
            .disposed(by: _disposeBag)
    }
    
    private func setCountLabel(with count: Int) {
        self.countLabel.text = Strings.TotalMovies.format(count)
    }
}
