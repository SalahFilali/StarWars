//
//  CommonLabel.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

class CommonLabel: UILabel {
    
    init(fontSize: CGFloat, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        textColor = .white
        font = Fonts.ArchivoVFBeta.regular.font(size: fontSize)
        self.numberOfLines = numberOfLines
    }
    
    convenience init(withStaticText text: String) {
        self.init(fontSize: 9)
        self.text = text
    }
    
    convenience init(blackFontSize: CGFloat, text: String) {
        self.init(fontSize: blackFontSize)
        textColor = .black
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
