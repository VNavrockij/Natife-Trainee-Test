//
//  MyTableViewCell.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import UIKit



class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var headerPost: UILabel!
    @IBOutlet weak var descriptionPost: UILabel!
    @IBOutlet weak var likesPost: UILabel!
    @IBOutlet weak var dataPost: UILabel!
    @IBOutlet weak var textOnButton: UIButton!

    var handler: ((Bool) -> Void)?

    var isExpanded: Bool = false

    static func nib() -> UINib {
         UINib(nibName: K.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
