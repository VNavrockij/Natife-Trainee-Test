//
//  DetailVC+Extensions.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 06.09.2023.
//

import UIKit

extension DetailViewController {
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
        URLSession.shared.dataTask(with: url) {  data, _, _ in
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
}
