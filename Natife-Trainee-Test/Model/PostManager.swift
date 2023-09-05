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
}
