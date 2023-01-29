//
//  FavoritWithoutDiffableController.swift
//  BacaBuku
//
//  Created by mamikos on 22/12/22.
//

import Foundation
import UIKit

class FavoritWithoutDiffableController: UIViewController {
    
    
    private let viewModel = FavoritWithoutDiffableViewModel()
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
    private func configureContents() {
        title = "Without DiffableDataSource"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonTapped)),
            UIBarButtonItem(image: .remove, style: .plain, target: self, action: #selector(removeButtonTapped))
        ]
    }
}


// MARK: - Actions
extension FavoritWithoutDiffableController {
    
    @objc
    private func addButtonTapped() {
        viewModel.addItem()
        tableView.reloadData()
    }
    
    @objc
    private func removeButtonTapped() {
        viewModel.removeItem()
        tableView.reloadData()
    }
}

// MARK: - UILayout
extension FavoritWithoutDiffableController {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

// MARK: -
extension FavoritWithoutDiffableController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(viewModel.cellItemAt(indexPath: indexPath))
        return cell
    }
}
