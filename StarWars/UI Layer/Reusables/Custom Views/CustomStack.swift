//
//  CustomStack.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

class CustomStack: UIStackView {
    
    private let _valueLabel: CommonLabel
    
    init(valueLabel: CommonLabel, titleLabel: CommonLabel) {
        _valueLabel = valueLabel
        super.init(frame: .zero)
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(valueLabel)
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.alignment = .leading
        self.spacing = 5
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(text: String) {
        _valueLabel.text = text
    }
}
