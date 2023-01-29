//
//  FavoritDiffableDataSource.swift
//  BacaBuku
//
//  Created by mamikos on 22/12/22.
//

import Foundation

enum DiffableSection {
    case main
    case song
}

struct DiffableItem: Hashable {
    let id = UUID()
    let title: Int
}

struct SongItem: Hashable {
    let id = UUID()
    let title: String
    let lyrics: String
}
