//
//  MainViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 31.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var selectedCells: [Int: Bool] = [:]

    var dataSource: [OnePost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

    let postManager = PostManager()
    var refreshControl = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        postManager.performRequest { [weak self] result in
            self?.dataSource = result
        }

        tableView.dataSource = self
        tableView.delegate = self

        tableView.registerCell(type: MyTableViewCell.self)

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(send: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    @IBAction func sortPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                dataSource.sort(by: { $0.timeshamp < $1.timeshamp })
            case 1:
                dataSource.sort(by: { $0.likesCount < $1.likesCount })
            default: print("def")
        }
        tableView.reloadData()
    }
}
