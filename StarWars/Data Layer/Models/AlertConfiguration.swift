//
//  AlertConfiguration.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

public typealias VoidClosure = () -> Void

public struct AlertConfiguration: Error {
    
    let title: String
    let descriptions: String
    let okAction: AlertConfigurationAction?
    
    init(title: String,
         descriptions: String,
         okAction: AlertConfigurationAction?) {
        
        self.title = title
        self.descriptions = descriptions
        self.okAction = okAction
    }
    
    static func internalError() -> AlertConfiguration {
        return AlertConfiguration(
            title: Strings.InternalError.title,
            descriptions: Strings.InternalError.text,
            okAction: .defaultAction)
    }
    
    static func networkError() -> AlertConfiguration {
        return AlertConfiguration(
            title: Strings.NetworkError.title,
            descriptions: Strings.NetworkError.title,
            okAction: .defaultAction)
    }
}

public struct AlertConfigurationAction {
    let buttonTitle: String
    let action: VoidClosure?
    
    static var defaultAction: AlertConfigurationAction {
        return AlertConfigurationAction(buttonTitle: Strings.OkButton.title, action: nil)
    }
}
