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
        guard let imageString = dataForPost?.postImage else { return }

        image.setImageFromStringrURL(stringUrl: imageString)

        if let title = dataForPost?.title,
            let text = dataForPost?.text,
            let likes = dataForPost?.likesCount,
            let timeshamp = dataForPost?.timeshamp {
            headerPostDetail.text = title
            descriptionPostDetail.text = text
            likesPostDetail.text = "❤️ \(likes)"
            dataPostDetail.text = convertCurrentDate(timeshamp)
        }
    }

    func clearingUI () {
        headerPostDetail.text = ""
        descriptionPostDetail.text = ""
        likesPostDetail.text = ""
        dataPostDetail.text = ""
    }

    func convertCurrentDate(_ timeshamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeshamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

extension UIImageView {
    func setImageFromStringrURL(stringUrl: String) {
        if let url = URL(string: stringUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
}
