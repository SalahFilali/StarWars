//
//  NiblessView.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

class NiblessView: UIView {

    var keyboardGesture: UIGestureRecognizer?

    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}

