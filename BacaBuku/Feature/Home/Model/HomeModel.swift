//
//  HomeModel.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation


// MARK: - BookModel
struct BookModel: Codable {
    let id: Int!
    let title: String!
    let writerID: Int!
    let coverURL, createdAt, scheduleTask, status: String!
    let writerByWriterID: WriterByWriterIDModel
    let isUpdate: Bool!
    let bookID: Int!
    let isNew: Bool!
    let subscribeCount, purchaseCount, viewCount: Int!
    let rateSum: Double!
    let chapterCount: Int!

    enum CodingKeys: String, CodingKey {
        case id, title
        case writerID = "writer_id"
        case coverURL = "cover_url"
        case createdAt = "created_at"
        case scheduleTask = "schedule_task"
        case status
        case writerByWriterID = "Writer_by_writer_id"
        case isUpdate = "is_update"
        case bookID = "book_id"
        case isNew
        case subscribeCount = "subscribe_count"
        case purchaseCount = "purchase_count"
        case viewCount = "view_count"
        case rateSum = "rate_sum"
        case chapterCount = "chapter_count"
    }
}

// MARK: - WriterByWriterIDModel
struct WriterByWriterIDModel: Codable {
    let id, userID: Int!
    let createdAt: String!
    let scheduleTask: String!
    let type: String!
    let warning: Int!
    let ugc: Int!
    let userByUserID: UserByUserIDModel

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case createdAt = "created_at"
        case scheduleTask = "schedule_task"
        case type, warning, ugc
        case userByUserID = "User_by_user_id"
    }
}

// MARK: - UserByUserIDModel
struct UserByUserIDModel: Codable {
    let id: Int!
    let name: String!
}
