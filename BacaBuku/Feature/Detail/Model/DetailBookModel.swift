//
//  DetailBookModel.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation

// MARK: - DetailBookModel
struct DetailBookModel: Codable {
    let id: Int!
    let title, desc, coverURL, synopsis: String!
    let writerByWriterID: DetailWriterByWriterIDModel
    let hashtags: [HashtagModel]

    enum CodingKeys: String, CodingKey {
        case id, title, desc, synopsis
        case writerByWriterID = "Writer_by_writer_id"
        case coverURL = "cover_url"
        case hashtags
    }
}

// MARK: - DetailWriterByWriterIDModel
struct DetailWriterByWriterIDModel: Codable {
    let id, userID: Int!
    let userByUserID: DetailUserByUserIDModel

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case userByUserID = "User_by_user_id"
    }
}

// MARK: - DetailUserByUserIDModel
struct DetailUserByUserIDModel: Codable {
    let id: Int!
    let name: String!
}

// MARK: - HashtagModel
struct HashtagModel: Codable {
    let editor, id: Int!
    let name: String!
}
