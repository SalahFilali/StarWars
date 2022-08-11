//
//  Loader.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

enum LoadingState {
    case loading
    case none
    case refreshLoading(_ isLoading: Bool)
}

class LoaderView: NiblessView {

    static let shared = LoaderView()

    // MARK: - Properties
    private let activityIndicator: UIActivityIndicatorView  = {
        let indicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            indicator.style = UIActivityIndicatorView.Style.whiteLarge
        }
        indicator.color = .black
        indicator.hidesWhenStopped = true
        return indicator
    }()

    // MARK: - Methods
    private override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }


    func showLoader(in window: UIWindow?) {
        guard let window = window else {
            return
        }
        window.addSubview(self)
        self.fillInParentView()
        self.isUserInteractionEnabled = true
        UIApplication.shared.delegate?.window??.isUserInteractionEnabled = false
        self.activityIndicator.startAnimating()
    }

    func hideLoader() {
        self.activityIndicator.stopAnimating()
        self.isUserInteractionEnabled = false
        UIApplication.shared.delegate?.window??.isUserInteractionEnabled = true
        self.removeFromSuperview()
    }

    private func constructHierarchy() {
        self.addSubview(activityIndicator)
    }

    override func didMoveToWindow() {
        self.constructHierarchy()
        self.activateLoaderConstraints()
    }

    private func activateLoaderConstraints() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        self.activityIndicator.widthAnchor.constraint(equalToConstant: 64.0).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

}
