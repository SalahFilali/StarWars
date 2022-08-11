//
//  UIView+Constraints.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

extension UIView {
    
    func fillInParentView(insetByVertical verticalInsets: CGFloat = .zero, horizontal horizontalInsets: CGFloat = .zero) {
        guard let parentView = self.superview else {
            print("⛔️⛔️ Calling Fill in parent without superView ")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: horizontalInsets).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: verticalInsets).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -horizontalInsets).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -verticalInsets).isActive = true
    }
    
    func fillInParentSafeArea(insetByVertical verticalInsets: CGFloat = .zero, horizontal horizontalInsets: CGFloat = .zero) {
        guard let parentView = self.superview else {
            print("⛔️⛔️ Calling Fill in parent without superView ")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInsets).isActive = true
        self.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor, constant: verticalInsets).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInsets).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor, constant: -verticalInsets).isActive = true
    }
    
    func centerInParentView(with xConstant: CGFloat = .zero, yConstant: CGFloat = .zero) {
        guard let parentView = self.superview else {
            print("⛔️⛔️ Calling Center in parent without superView ")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: xConstant).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: yConstant).isActive = true
    }
}

