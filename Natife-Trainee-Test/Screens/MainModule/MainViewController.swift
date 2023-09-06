//
//  MainViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 31.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var dataSource: [OnePost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    let postManager = PostManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        postManager.performRequest { [weak self] result in
            self?.dataSource = result
        }

        tableView.dataSource = self
        tableView.delegate = self

        tableView.registerCell(type: MyTableViewCell.self)
    }

    @IBAction func sortPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                dataSource.sort(by: {$0.timeshamp < $1.timeshamp})
            case 1:
                dataSource.sort(by: {$0.likesCount < $1.likesCount})
            default: print("def")
        }
        tableView.reloadData()

    }

}
