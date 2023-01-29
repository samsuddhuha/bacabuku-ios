//
//  FavoritWithoutDiffableViewModel.swift
//  BacaBuku
//
//  Created by mamikos on 22/12/22.
//

import Foundation

class FavoritWithoutDiffableViewModel: NSObject {
    private var items = [1,2,3,4,5]
        
    var numberOfItems: Int {
        return items.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> Int {
        return items[indexPath.row]
    }
    
    func addItem() {
        items.append(Int.random(in: 1...100))
    }
    
    func removeItem() {
        if !items.isEmpty {
            items.remove(at: Int.random(in: 0..<items.count))
        }
    }
}
