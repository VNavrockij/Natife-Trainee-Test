//
//  ExtensionMainViewController.swift
//  Natife-Trainee-Test
//
//  Created by Vitalii Navrotskyi on 04.09.2023.
//

import UIKit

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: K.detailVC) as? DetailViewController else { return }
        let post = dataSource[indexPath.row].postID
        detailVC.postID = post
        navigationController?.pushViewController(detailVC, animated: true)


    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            let cell = tableView.dequeueCell(withType: MyTableViewCell.self)
        else {
            return .init()
        }

        cell.headerPost.text = dataSource[indexPath.row].title
        cell.descriptionPost.text = dataSource[indexPath.row].previewText
        cell.likesPost.text = "❤️ \(String(dataSource[indexPath.row].likesCount))"
        cell.dataPost.text = convertToDayAgo(dataSource[indexPath.row].timeshamp)

        if selectedCells[indexPath.row] == true {
                cell.descriptionPost.numberOfLines = 0
                cell.textOnButton.titleLabel?.text = "Collapse"
        } else {
                cell.descriptionPost.numberOfLines = 2
                cell.textOnButton.titleLabel?.text = "Expand"
        }

        cell.handler = { isExpan in
            self.selectedCells[indexPath.row] = isExpan
            tableView.beginUpdates()
//            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            tableView.endUpdates()
        }

        print(selectedCells)
        return cell
    }

    func convertToDayAgo(_ timeshamp: Int) -> String {
        let currentDate = Date()
        let date = Date(timeIntervalSince1970: TimeInterval(timeshamp))
        let calendar = Calendar.current
        let daysAgo = calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
        return "\(daysAgo) days ago"
    }
}

public extension UITableView {
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UITableViewCell.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }

    /**
     DequeueCell by passing the type of UITableViewCell
     - Parameter type: UITableViewCell.Type
     */
    func dequeueCell<T: UITableViewCell>(withType type: T.Type) -> T? {
        dequeueReusableCell(withIdentifier: type.identifier) as? T
    }

    /**
     DequeueCell by passing the type of UITableViewCell and IndexPath
     - Parameter type: UITableViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }

}

public extension UITableViewCell {
    static var identifier: String { .init(describing: self) }
}
