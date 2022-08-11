//
//  MoviesRootView.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

enum CellIndentifier: String {
    case movie = "MovieCell"
}
class MoviesRootView: NiblessView {
    
    private let _disposeBag = DisposeBag()
    private var _hierarchyNotReady = true
    
    private let _viewModel: MoviesViewModel
    
    private lazy var _refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(_viewModel, action: #selector(MoviesViewModel.refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: Strings.RefreshLoading.title)
        return refreshControl
    }()
    
    private lazy var _tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieCell.self, forCellReuseIdentifier: CellIndentifier.movie.rawValue)
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 136
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    init(viewModel: MoviesViewModel) {
        _viewModel = viewModel
        super.init(frame: .zero)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard _hierarchyNotReady else { return }
        
        constructHierarchy()
        activateConstraints()
        rxBinding()
        _viewModel.loadMovies()
        backgroundColor = .white
        
        _hierarchyNotReady = false
    }
    
    private func constructHierarchy() {
        addSubview(_tableView)
        _tableView.refreshControl = _refreshControl
    }
    
    private func activateConstraints() {
        self._tableView.fillInParentView()
    }
    
}

extension MoviesRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MoviesTableViewHeader(countObservable: _viewModel.items.map({$0.count}))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
}

//MARK: - Rx
extension MoviesRootView {
    
    private func rxBinding() {
        bindItems()
        bindItemSelection()
        subscribeToLoadingState()
    }
    
    private func bindItems() {
        _viewModel
            .items
            .bind(to: _tableView.rx.items(cellIdentifier: CellIndentifier.movie.rawValue, cellType: MovieCell.self)) { (row, movie, cell) in
                cell.setup(with: movie)
            }.disposed(by: _disposeBag)
    }
    
    private func bindItemSelection() {
        _tableView
            .rx
            .modelSelected(Movie.self)
            .bind(to: _viewModel.selectedItem)
            .disposed(by: _disposeBag)
    }
    
    private func subscribeToLoadingState() {
        _viewModel
            .loadingState
            .subscribe(onNext: {[weak self] state in
                switch state {
                case .refreshLoading(let isRefreshing):
                    if !isRefreshing {
                        self?._refreshControl.endRefreshing()
                    }
                case .loading:
                    LoaderView.shared.showLoader(in: self?.window)
                default:
                    LoaderView.shared.hideLoader()
                }
            }).disposed(by: _disposeBag)
    }
}

