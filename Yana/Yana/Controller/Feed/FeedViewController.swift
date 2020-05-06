//
//  FeedViewController.swift
//  Yana
//
//  Created by Pedro Sousa on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private let tags = Tag.getAllTags()

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: FeedHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        configureTable()
    }

    public func layoutSettings() {
        table.backgroundColor = .defaultWhite
        table.allowsSelection = false
        table.sectionHeaderHeight = 50
    }

    private func configureTable() {
        let talbleCellNib = UINib(
            nibName: CommunityTableViewCell.nibName,
            bundle: nil)
        table.register(
            talbleCellNib,
            forCellReuseIdentifier: CommunityTableViewCell.identifier)

        let sectionNib = UINib(
            nibName: RecentActivitySectionHeader.nibName,
            bundle: nil)
        table.register(
            sectionNib,
            forHeaderFooterViewReuseIdentifier: RecentActivitySectionHeader.identifier)
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: RecentActivitySectionHeader.identifier
            ) else { fatalError("(RecentActivitySectionHeader) Wrong xib name") }

        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CommunityTableViewCell.identifier,
            for: indexPath) as? CommunityTableViewCell else {
                fatalError("(TableViewCell) Wrong Identifier")
        }

        cell.configure(tag: tags[indexPath.row])
        return cell
    }
}
