//
//  ComprovantesViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import UIKit

class ComprovantesViewController: BaseUIViewController {
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 25
        tableView.separatorStyle = .none
        tableView.bounces = false
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
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.atualizarComprovantes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.title = "Comprovantes"
        
        let rightImage = UIImage(systemName: "arrow.circlepath")
        rightImage?.withTintColor(.white)
        let rightButton = UIBarButtonItem(image: rightImage, style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = rightButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ComprovanteUITableViewCell.self, forCellReuseIdentifier: "ComprovanteUITableViewCell")
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
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
        tableView.deselectRow(at: indexPath, animated: false)
        guard let comprovante = viewModel.comprovantes?[indexPath.row] else { return }
        self.navigationController?.pushViewController(DetalhesDoComprovanteUIViewController(comprovante: comprovante), animated: true)
    }
}
