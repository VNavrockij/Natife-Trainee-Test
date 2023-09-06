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
        descriptionPostDetail.font = .systemFont(ofSize: 12)

        image.image = UIImage(systemName: "paperplane.fill")

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
