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
    let postID, timeshamp: Int
    let title, previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
