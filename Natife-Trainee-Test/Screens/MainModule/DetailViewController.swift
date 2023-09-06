//
//  DetailViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 06.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var headerPostDetail: UILabel!
    @IBOutlet weak var descriptionPostDetail: UILabel!
    @IBOutlet weak var likesPostDetail: UILabel!
    @IBOutlet weak var dataPostDetail: UILabel!

    var postID: Int?

    var dataForPost: Post? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }

    let postManager = PostManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        postManager.performRequestForDetail(postID) { [weak self] result in
            self?.dataForPost = result
        }
    }
}
