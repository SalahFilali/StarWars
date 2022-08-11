//
//  BaseNiblessViewController.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class BaseNiblessViewController<T:BaseViewModel>: NiblessViewController {

    lazy var _disposeBag = DisposeBag()

    let _viewModel: T

    init(viewModel: T) {
        _viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func subscribeToAlertState() {
        _viewModel
            .alertConfig
            .subscribe(onNext: {[weak self] alertConfig in
                self?.presentAlert(for: alertConfig)
            }).disposed(by: _disposeBag)

    }
}
