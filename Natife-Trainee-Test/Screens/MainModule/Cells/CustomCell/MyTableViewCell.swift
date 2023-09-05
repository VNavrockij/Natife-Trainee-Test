//
//  MyTableViewCell.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
//    @IBOutlet internal weak var customLabel: UILabel!
    @IBOutlet weak var headerPost: UILabel!
    @IBOutlet weak var descriptionPost: UILabel!
    @IBOutlet weak var likesPost: UILabel!
    @IBOutlet weak var dataPost: UILabel!

    static func nib() -> UINib {
         UINib(nibName: K.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
        backgroundColor = .opaqueSeparator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button Pressed")
    }
    
}
