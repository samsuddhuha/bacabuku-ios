//
//  FavoritWithDiffableController.swift
//  BacaBuku
//
//  Created by mamikos on 22/12/22.
//

import Foundation
import UIKit

class FavoritWithDiffableController: UIViewController {
    
    private let viewModel = FavotritWithDiffableViewModel()
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
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
        viewModel.viewDidLoad(tableView: tableView)
    }
    
    private func configureContents() {
        title = "With DiffableDataSource"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonTapped)),
            UIBarButtonItem(image: .remove, style: .plain, target: self, action: #selector(removeButtonTapped))
        ]
    }
}


// MARK: - Actions
extension FavoritWithDiffableController {
    
    @objc
    private func addButtonTapped() {
        viewModel.addItem()
    }
    
    @objc
    private func removeButtonTapped() {
        viewModel.removeItem()
    }
}

// MARK: - UILayout
extension FavoritWithDiffableController {
    
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
