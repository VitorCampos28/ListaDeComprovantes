//
//  ComprovanteUITableViewCell.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import UIKit

class ComprovanteUITableViewCell: UITableViewCell {
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
    
    lazy var titulo: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var valor: UILabel = {
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
    
    lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .blueCustom
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        return view
    }()
    
    lazy var nomeDoFavorecido = UILabel()
    lazy var data = UILabel()
    var comprovante: Comprovante?
    
    func setupCell() {
        self.contentView.addSubview(titulo)
        self.contentView.addSubview(horizontalStackView)
        self.contentView.addSubview(separatorLine)
        
    
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(valor)
        horizontalStackView.addArrangedSubview(rightArrow)
        
        verticalStackView.addArrangedSubview(nomeDoFavorecido)
        verticalStackView.addArrangedSubview(data)
        
        NSLayoutConstraint.activate([
            titulo.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titulo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titulo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            separatorLine.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            separatorLine.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separatorLine.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 10),
            
            separatorLine.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            separatorLine.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separatorLine.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    
    func setupData() {
        titulo.text = comprovante?.title.removingWrongCharacters()
        nomeDoFavorecido.text = comprovante?.receiverName.removingWrongCharacters()
        valor.text = comprovante?.amount
        data.text = comprovante?.date
    }
}
