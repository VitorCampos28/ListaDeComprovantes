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
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var nomeDoFavorecido = UILabel()
    lazy var valor = UILabel()
    lazy var data = UILabel()
    var comprovante: Comprovante?
    
    func setupCell() {
        self.contentView.addSubview(titulo)
        self.contentView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(nomeDoFavorecido)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(valor)
        verticalStackView.addArrangedSubview(data)
        
        NSLayoutConstraint.activate([
            titulo.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titulo.topAnchor.constraint(equalTo: contentView.topAnchor),
            titulo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func setupData() {
        titulo.text = comprovante?.title
        nomeDoFavorecido.text = comprovante?.receiverName
        valor.text = comprovante?.amount
        data.text = comprovante?.date
    }
}
