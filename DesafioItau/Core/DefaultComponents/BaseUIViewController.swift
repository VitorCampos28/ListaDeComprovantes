//
//  BaseUIViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    let navBarAppearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationAppearance()
    }
    
    private func setupController() {
        self.view.backgroundColor = .blueCustom
    }
    
    private func setupNavigationAppearance() {
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Aplica a configuração para todos os estados da barra
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}
