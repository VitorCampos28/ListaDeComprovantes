//
//  ComprovantesViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import UIKit

class ComprovantesViewController: UIViewController {
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let viewModel: ComprovantesViewModelProtocol
    
    init (viewModel: ComprovantesViewModelProtocol = ComprovantesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.atualizarComprovantes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupView(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.register(ComprovanteUITableViewCell.self, forCellReuseIdentifier: "ComprovanteUITableViewCell")
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension ComprovantesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comprovantes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComprovanteUITableViewCell", for: indexPath) as? ComprovanteUITableViewCell else {
            return UITableViewCell()
        }
        if let comprovante =  viewModel.comprovantes?[indexPath.row] {
            cell.comprovante = comprovante
            cell.setupData()
            cell.setupCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let comprovante = viewModel.comprovantes?[indexPath.row] else { return }
        self.navigationController?.pushViewController(DetalhesDoComprovanteUIViewController(comprovante: comprovante), animated: true)
    }
}
