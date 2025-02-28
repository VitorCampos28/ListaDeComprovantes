//
//  DetalhesDoComprovanteUIViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import UIKit

class DetalhesDoComprovanteUIViewController: BaseUIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 25
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width - 20).isActive = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        return stackView
    }()
    
    let comprovante: Comprovante
    
    init(comprovante: Comprovante) {
        self.comprovante = comprovante
        super.init(nibName: nil, bundle: nil)
        setupData()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.title = "Detalhes do Comprovante"
    }
    
    private func setupView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            verticalStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10),
            verticalStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10),
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupData(){
        

        let rowsData = [
            ("Nome:", comprovante.name),
            ("Favorecido:", comprovante.receiverName),
            ("Valor:", comprovante.amount),
            ("Data:", comprovante.date),
            ("Controle:", comprovante.control),
            ("ID da transação:", comprovante.receiptId)
            ]
        
        for (key, value) in rowsData {
            let titleView = UILabel()
            titleView.text = key
            titleView.textAlignment = .left
            let valueView = UILabel()
            valueView.textAlignment = .right
            valueView.numberOfLines = 0
            valueView.text = value.removingWrongCharacters()
            let separatorView = SeparatorView(backgroundColor: .black, height: 1)
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            
            stackView.addArrangedSubview(titleView)
            stackView.addArrangedSubview(valueView)
            
            verticalStackView.addArrangedSubview(stackView)
            verticalStackView.addArrangedSubview(separatorView)
        }
    }
}
