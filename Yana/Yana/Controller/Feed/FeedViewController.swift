//
//  FeedViewController.swift
//  Yana
//
//  Created by Pedro Sousa on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: FeedHeaderView!

    static let dataManager: DataManager = DataManager()
    var currentUser: Person = dataManager.getUsers().first!
    var communities: [Community] = dataManager.getCommunities()

    var communityData: [PostPackage] = []
    var postData: PostPackage?

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        configureTable()
        configureHeader()
    }

    public func layoutSettings() {
        table.backgroundColor = .defaultWhite
        table.allowsSelection = false
        table.sectionHeaderHeight = 50
    }

    public func configureHeader() {
        header.picture.image = UIImage(
            named: currentUser.imageNameProfile
        )
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

    func goToCommunity(identifier: Int) {
        communityData = FeedViewController.dataManager.getAllActivitiesCommunity(identifier: identifier)
        performSegue(withIdentifier: "communityProfile", sender: nil)
    }

    func goToPost(data: PostPackage) {
        postData = data
        performSegue(withIdentifier: "viewPost", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "communityProfile":
            guard let communityViewController = segue.destination as? CommunityProfileTableViewController else {
                fatalError("Unexpected Segue Destination; \(String(describing: segue.destination))")
            }
            communityViewController.infocommunity = communityData

        case "viewPost":
            print("viewPost")
            guard let postViewController = segue.destination as? ViewPostTable else {
                fatalError("Unexpected Segue Destination; \(String(describing: segue.destination))")
            }
            postViewController.post = postData
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))  and Destination: \(String(describing: segue.destination));")
        }
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
        return communities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CommunityTableViewCell.identifier,
            for: indexPath) as? CommunityTableViewCell else {
                fatalError("(TableViewCell) Wrong Identifier")
        }

        cell.configure(community: communities[indexPath.row])
        cell.delegate = self
        return cell
    }
}
