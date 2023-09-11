//
//  DetailViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 06.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak private var image: UIImageView!
    @IBOutlet weak private var headerPostDetail: UILabel!
    @IBOutlet weak private var descriptionPostDetail: UILabel!
    @IBOutlet weak private var likesPostDetail: UILabel!
    @IBOutlet weak private var dataPostDetail: UILabel!

    var postID: Int?

    let activityIndicator = UIActivityIndicatorView(style: .large)

    var dataForPost: Post? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
                self.activityIndicator.stopAnimating()
            }
        }
    }

    let postManager = PostManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        clearingUI()

        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        postManager.performRequestForDetail(postID) { [weak self] result in
            self?.dataForPost = result
        }
    }

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

    func clearingUI() {
        headerPostDetail.text = ""
        descriptionPostDetail.text = ""
        likesPostDetail.text = ""
        dataPostDetail.text = ""
    }
}
