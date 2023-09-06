//
//  PostData.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import Foundation

// MARK: - Post
struct Posts: Codable {
    let posts: [OnePost]
}

struct OnePost: Codable {
    let postID: Int
    let timeshamp: Int
    let title: String
    let previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp
        case title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}

struct DetailPost: Codable {
    let post: Post
}

struct Post: Codable {
    let postID: Int
    let timeshamp: Int
    let title: String
    let text: String
    let postImage: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp
        case title
        case text
        case postImage
        case likesCount = "likes_count"
    }
}
