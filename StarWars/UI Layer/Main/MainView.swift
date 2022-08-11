//
//  MainView.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

enum NavigationAction<T:Equatable>: Equatable {
    case present(T)
    case presented(T)
}

public enum MainView: Equatable {
    case home
}

typealias MainNavigationAction = NavigationAction<MainView>
