//
//  MainViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 31.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    let arrTest: [String] = ["Natife1", "Natife2", "Natife3"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: K.identifier)
    }
}
