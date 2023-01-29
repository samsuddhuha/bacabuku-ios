//
//  FavotritWithDiffableViewModel.swift
//  BacaBuku
//
//  Created by mamikos on 22/12/22.
//

import Foundation
import UIKit

class FavotritWithDiffableViewModel: NSObject {
    
    private var snapshot = NSDiffableDataSourceSnapshot<DiffableSection, AnyHashable>()
    private var dataSource: UITableViewDiffableDataSource<DiffableSection, AnyHashable>!
    
    private var items = [
        DiffableItem(title: 1),
        DiffableItem(title: 2),
        DiffableItem(title: 3),
        DiffableItem(title: 4)
    ]
    
    private var songs = [
        SongItem(title: "Wafin Flak", lyrics: "Wavin Flash"),
        SongItem(title: "Waka Waka", lyrics: "Egg egg"),
    ]
    
    private func setupTableViewDataSource(tableView: UITableView) {
        dataSource = UITableViewDiffableDataSource<DiffableSection, AnyHashable>(tableView: tableView) {
            tableView, indexPath, itemIdentifier in
            if let items = itemIdentifier as? DiffableItem {
                let cell = UITableViewCell()
                cell.textLabel?.text = String(items.title)
                return cell
            } else if let songs = itemIdentifier as? SongItem {
                let cell = UITableViewCell()
                cell.textLabel?.text = String(songs.title)
                return cell
            } else {
                fatalError("Unknown cell type")
            }
        }
        
        snapshot.appendSections([.main, .song])
        snapshot.appendItems(items, toSection: .main)
        snapshot.appendItems(songs, toSection: .song)
        
        updateDataSource()
    }
    
    func viewDidLoad(tableView: UITableView) {
        setupTableViewDataSource(tableView: tableView)
    }
    
    func addItem() {
        let newItem = DiffableItem(title: Int.random(in: 1...100))
        items.append(newItem)
        snapshot.appendItems([newItem])
        updateDataSource()
    }
    
    func removeItem() {
        if !items.isEmpty {
            let removed = items.remove(at: Int.random(in: 0..<items.count))
            snapshot.deleteItems([removed])
            updateDataSource()
        }
    }
    
    private func updateDataSource() {
        dataSource.apply(snapshot)
    }
}
