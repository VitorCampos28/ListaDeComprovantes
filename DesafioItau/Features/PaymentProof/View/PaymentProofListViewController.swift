//
//  PaymentProofListViewController.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import UIKit

class PaymentProofListViewController: BaseUIViewController {
    private enum Constants: String {
        case navigationTitle = "Comprovantes"
        case reloadImageName = "arrow.circlepath"
        case cellIdentifier = "ComprovanteUITableViewCell"
    }
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 25
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel: PaymentProofListViewModelProtocol
    var paymentProofList: [PaymentProof]?
    
    init (viewModel: PaymentProofListViewModelProtocol = PaymentProofListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        callService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    

    private func callService() {
        viewModel.updateProofList { result in
            
            switch result {
            case .success(let success):
                self.paymentProofList = success
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                
                self.navigationController?.present(alert, animated: true)
            }
        }
    }
    
    private func setupNavigation() {
        self.title = Constants.navigationTitle.rawValue
        
        let rightImage = UIImage(systemName: Constants.reloadImageName.rawValue)
        rightImage?.withTintColor(.white)
        let rightButton = UIBarButtonItem(image: rightImage, style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = rightButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PaymentProofListUITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier.rawValue)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
}

extension PaymentProofListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        paymentProofList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier.rawValue, for: indexPath) as? PaymentProofListUITableViewCell else {
            return UITableViewCell()
        }
        if let paymentProof =  paymentProofList?[indexPath.row] {
            cell.paymentProof = paymentProof
            cell.setupData()
            cell.setupCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let paymentProof = paymentProofList?[indexPath.row] else { return }
        self.navigationController?.pushViewController(PaymentProofDetailsViewController(paymentProof: paymentProof), animated: true)
    }
}
