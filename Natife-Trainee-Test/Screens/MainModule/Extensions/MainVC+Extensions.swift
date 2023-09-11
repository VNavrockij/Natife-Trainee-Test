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

        let storyBoard = UIStoryboard(name: Constants.main, bundle: nil)
        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: Constants.detailVC) as? DetailViewController else { return }
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

        cell.setContent(
            title: dataSource[indexPath.row].title,
            description: dataSource[indexPath.row].previewText,
            likes: dataSource[indexPath.row].likesCount,
            dateStamp: dataSource[indexPath.row].timeshamp
        )

        cell.configColaapse(selectedCells.contains(indexPath))

        cell.handler = { [indexPath] isExpan in
            switch isExpan {
                case true:
                    self.selectedCells.insert(indexPath)

                case false:

                    self.selectedCells.remove(indexPath)
            }
            tableView.beginUpdates()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        return cell
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
