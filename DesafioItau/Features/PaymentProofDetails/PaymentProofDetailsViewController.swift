//
//  PaymentProofDetailsViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import UIKit

class PaymentProofDetailsViewController: BaseUIViewController {
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
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        return stackView
    }()
    
    let paymentProof: PaymentProof
    
    init(paymentProof: PaymentProof) {
        self.paymentProof = paymentProof
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
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
        self.title = paymentProof.title.removeSpecialChars()
        
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
            ("Nome:", paymentProof.name),
            ("Favorecido:", paymentProof.receiverName),
            ("Valor:", paymentProof.amount),
            ("Data:", paymentProof.date),
            ("Controle:", paymentProof.control),
            ("ID da transação:", paymentProof.receiptId)
            ]
        
        for (key, value) in rowsData {
            let titleView = UILabel()
            titleView.text = key
            titleView.textAlignment = .left
            let valueView = UILabel()
            valueView.textAlignment = .right
            valueView.numberOfLines = 0
            valueView.text = value.removeSpecialChars()
            let separatorView = SeparationView(backgroundColor: .black, height: 1)
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            
            stackView.addArrangedSubview(titleView)
            stackView.addArrangedSubview(valueView)
            
            verticalStackView.addArrangedSubview(stackView)
            if !(key == "ID da transação:") {
                verticalStackView.addArrangedSubview(separatorView)
            }
        }
    }
}
