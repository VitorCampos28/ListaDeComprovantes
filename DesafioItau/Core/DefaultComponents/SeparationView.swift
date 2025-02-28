//
//  SeparationView.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import UIKit

class SeparationView: UIView {
    
    init(backgroundColor: UIColor = .blueCustom, height: CGFloat = 2) {
        super.init(frame: .zero)
        setupView(backgroundColor: backgroundColor, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(backgroundColor: UIColor, height: CGFloat) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
