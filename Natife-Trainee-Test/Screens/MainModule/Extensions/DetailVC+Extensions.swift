//
//  DetailVC+Extensions.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 06.09.2023.
//


import UIKit

extension DetailViewController {
    func updateUI() {
        headerPostDetail.font = .boldSystemFont(ofSize: 18)
        descriptionPostDetail.font = .systemFont(ofSize: 14)

        guard let imageString = dataForPost?.postImage, let imageURL = URL(string: imageString) else { return }
        do {
            let imageData = try Data(contentsOf: imageURL)
            image.image = UIImage(data: imageData)
            } catch {
                print(error.localizedDescription)
            }

        if let title = dataForPost?.title,
            let text = dataForPost?.text,
            let likes = dataForPost?.likesCount,
            let timeshamp = dataForPost?.timeshamp {
            headerPostDetail.text = title
            descriptionPostDetail.text = text
            likesPostDetail.text = "❤️ \(likes)"
            dataPostDetail.text = "\(timeshamp)"
        }

    }
}
