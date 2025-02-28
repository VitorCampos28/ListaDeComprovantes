//
//  PaymentProofListUITableViewCell.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import UIKit

class PaymentProofListUITableViewCell: UITableViewCell {
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return stackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var value: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    lazy var rightArrow: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var separationView: UIView = SeparationView()
    
    lazy var payeeName = UILabel()
    lazy var date = UILabel()
    var paymentProof: PaymentProof?
    
    func setupCell() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(horizontalStackView)
        self.contentView.addSubview(separationView)
        
    
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(value)
        horizontalStackView.addArrangedSubview(rightArrow)
        
        verticalStackView.addArrangedSubview(payeeName)
        verticalStackView.addArrangedSubview(date)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            separationView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            separationView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separationView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            separationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            separationView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            separationView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separationView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            separationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    
    func setupData() {
        titleLabel.text = paymentProof?.title.removeSpecialChars()
        payeeName.text = paymentProof?.receiverName.removeSpecialChars()
        value.text = paymentProof?.amount
        date.text = paymentProof?.date
    }
}
