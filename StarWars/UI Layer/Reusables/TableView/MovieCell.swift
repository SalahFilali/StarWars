//
//  MovieCell.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

class MovieCell: UITableViewCell {
    
    private var _hierarchyNotReady = true
    
    private let _containerView = UIView()
    
    private let _titleLabel = CommonLabel(fontSize: 24)
    private let _openingLabel: CommonLabel = {
        let label = CommonLabel(fontSize: 13)
        label.numberOfLines = 2
        return label
    }()
    let _releaseDateStack = CustomStack(valueLabel: CommonLabel(fontSize: 13), titleLabel: CommonLabel(withStaticText: Strings.ReleaseDate.title))
    let _directorStack = CustomStack(valueLabel: CommonLabel(fontSize: 13), titleLabel: CommonLabel(withStaticText: Strings.Director.title))
    let _producerStack = CustomStack(valueLabel: CommonLabel(fontSize: 13), titleLabel: CommonLabel(withStaticText: Strings.Producer.title))
    
    private lazy var _topStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_titleLabel, _releaseDateStack])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var _middleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_directorStack,_producerStack])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    
    private lazy var _contentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [_topStack, _middleStack, _openingLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        _titleLabel.text = nil
        _producerStack.setValue(text: "")
        _directorStack.setValue(text: "")
        _releaseDateStack.setValue(text: "")
        _openingLabel.text = nil
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard _hierarchyNotReady else { return }
        
        constructHierarchy()
        activateConstraints()
        _containerView.backgroundColor = .black
        contentView.backgroundColor = .clear
        _hierarchyNotReady = false
    }
    
    private func constructHierarchy() {
        contentView.addSubview(_containerView)
        _containerView.addSubview(_contentStack)
    }
    
    private func activateConstraints() {
        _contentStack.fillInParentView(insetByVertical: 9, horizontal: 9)
        _containerView.fillInParentView(insetByVertical: 3)
    }
    
    func setup(with movie: Movie) {
        _titleLabel.text = movie.title
        _producerStack.setValue(text: movie.producer)
        _directorStack.setValue(text: movie.director)
        _releaseDateStack.setValue(text: movie.release)
        _openingLabel.text = movie.openingCrawl
    }
}
