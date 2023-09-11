//
//  MyTableViewCell.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak private var headerPost: UILabel!
    @IBOutlet weak private var descriptionPost: UILabel!
    @IBOutlet weak private var likesPost: UILabel!
    @IBOutlet weak private var dataPost: UILabel!
    @IBOutlet weak private var textOnButton: UIButton!

    var handler: ((Bool) -> Void)?

    var isExpanded: Bool = false

    static func nib() -> UINib {
         UINib(nibName: Constants.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setContent(title: String, description: String, likes: Int, dateStamp: Int) {
        headerPost.text = title
        descriptionPost.text = description
        likesPost.text = "❤️ \(String(likes))"
        dataPost.text = convertToDayAgo(dateStamp)
    }

    func convertToDayAgo(_ timeshamp: Int) -> String {
        let currentDate = Date()
        let date = Date(timeIntervalSince1970: TimeInterval(timeshamp))
        let calendar = Calendar.current
        let daysAgo = calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
        return "\(daysAgo) days ago"
    }

    func configColaapse(_ isCollapse: Bool = false) {
        switch isCollapse {
            case true:
                setExpContent()
            case false:
                setCollapseContent()
        }

    }

    private func setExpContent() {
        self.descriptionPost.numberOfLines = 0
        self.textOnButton.setTitle("Collapse", for: .normal)
    }

    private func setCollapseContent() {
        self.descriptionPost.numberOfLines = 2
        self.textOnButton.setTitle("Expand", for: .normal)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let textOnbutton = sender.titleLabel?.text else { return }

        switch textOnbutton {
            case "Expand":
                    self.descriptionPost.numberOfLines = 0
                    self.textOnButton.setTitle("Collapse", for: .normal)
                    self.isExpanded = true
            case "Collapse":
                    self.descriptionPost.numberOfLines = 2
                    self.textOnButton.setTitle("Expand", for: .normal)
                    self.isExpanded = false
            default:
                break
        }

        handler?(self.isExpanded)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
