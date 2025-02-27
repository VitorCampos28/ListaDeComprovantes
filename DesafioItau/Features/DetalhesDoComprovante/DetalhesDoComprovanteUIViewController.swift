//
//  DetalhesDoComprovanteUIViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import UIKit

class DetalhesDoComprovanteUIViewController: UIViewController {

    let comprovante: Comprovante
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titulo = UILabel()
    lazy var nome = UILabel()
    lazy var nomeDoFavorecido = UILabel()
    lazy var valor = UILabel()
    lazy var data = UILabel()
    lazy var controle = UILabel()
    lazy var idDaTransacao = UILabel()
    
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
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.tintColor = .black
        self.title = "Detalhes do Comprovante"
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(titulo)
        stackView.addArrangedSubview(nome)
        stackView.addArrangedSubview(nomeDoFavorecido)
        stackView.addArrangedSubview(valor)
        stackView.addArrangedSubview(data)
        stackView.addArrangedSubview(controle)
        stackView.addArrangedSubview(idDaTransacao)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupData(){
        titulo.text = comprovante.title
        nome.text = comprovante.name
        nomeDoFavorecido.text = comprovante.receiverName
        valor.text = comprovante.amount
        data.text = comprovante.date
        controle.text = comprovante.control
        idDaTransacao.text = comprovante.receiptId
    }
}
