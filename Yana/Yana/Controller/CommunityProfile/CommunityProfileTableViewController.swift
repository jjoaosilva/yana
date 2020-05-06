//
//  CommunityProfileTableViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityProfileTableViewController: UITableViewController {

    @IBOutlet weak var imageCommunity: UIImageView!
    @IBOutlet weak var tagCommunity: UILabel!
    @IBOutlet weak var peopleTalkLabel: UILabel!
    @IBOutlet weak var optionsChoise: UISegmentedControl!
    @IBOutlet weak var plusPostButton: UIBarButtonItem!
    @IBOutlet weak var searchField: FormTextField!
    @IBOutlet weak var viewTable: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        //tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Identificador na storyboard
        let cellIdentifier = "CommunityProfileTableViewCell"

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath) as?
            CommunityProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // injetar os dados do dataSource nas celulas
        // cell.dataItem = items[indexPath.row]

        return cell
    }

//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .clear
//        return view
//
//    }

    // MARK: - Private functions

    private func layoutSettings() {
        viewTable.backgroundColor = .defaultWhite
        tableView.allowsSelection = false

        tagCommunity.textColor = .primaryColor
        tagCommunity.font = .bellotaTitle

        peopleTalkLabel.textColor = .primaryColor
        peopleTalkLabel.font = .bellotaTag

        plusPostButton.tintColor = .primaryColor
        self.navigationController?.navigationBar.tintColor = .primaryColor

        searchField.backgroundColor = .defaultWhite
        searchField.layer.borderColor = UIColor.primaryColor.cgColor
        searchField.layer.borderWidth = 1
        searchField.layer.cornerRadius = 10

        if #available(iOS 13.0, *) {
            optionsChoise.selectedSegmentTintColor = .primaryColor
        }
        optionsChoise.backgroundColor = .secondaryColor

        imageCommunity.layer.masksToBounds = true
        imageCommunity.layer.cornerRadius = imageCommunity.bounds.width / 2
    }
}
