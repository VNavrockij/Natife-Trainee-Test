//
//  PostManager.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import Foundation

struct PostManager {
    func performRequest(completion: (([OnePost]) -> Void)?) {
        let decoder = JSONDecoder()
        if let url = URL(string: K.scrollPostsAPI) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                guard error == nil,
                      let data = data,
                      let decodeData = try? decoder.decode(Posts.self, from: data) else { return }
                completion?(decodeData.posts)
            }
            task.resume()
        }
    }

    func performRequestForDetail(_ postID: Int?, completion: ((Post) -> Void)?) {
        guard let savePostID = postID else { return }

        let decoder = JSONDecoder()
        if let url = URL(string: "\(K.selectPostAPI)\(savePostID)\(K.tailJSON)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                guard error == nil,
                      let data = data,
                      let decoderData = try? decoder.decode(DetailPost.self, from: data) else { return }
                completion?(decoderData.post)
            }
            task.resume()
        }
    }
}
