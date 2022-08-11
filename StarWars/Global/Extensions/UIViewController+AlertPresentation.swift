//
//  UIViewController+ErrorPresentation.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

extension UIViewController {
    
    public func presentAlert(for configuration: AlertConfiguration) {
        let errorAlertController = UIAlertController(title: configuration.title, message: configuration.descriptions, preferredStyle: .alert)
        self.setAction(for: errorAlertController, from: configuration)
      present(errorAlertController, animated: true, completion: nil)
    }
    
    private func setAction(for alert: UIAlertController, from configuration: AlertConfiguration) {
        if let okAction = configuration.okAction {
            let alertAction = UIAlertAction(
                title: okAction.buttonTitle,
                style: .default) { _ in
                    okAction.action?()
                }
            alert.addAction(alertAction)
        }
    }
}
