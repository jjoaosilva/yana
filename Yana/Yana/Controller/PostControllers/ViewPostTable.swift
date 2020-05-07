//
//  ViewPostTable.swift
//  Yana
//
//  Created by Jose Joao Silva Nunes Alves on 29/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class ViewPostTable: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var headerTable: ViewPostHeaderTable!

    var post: PostPackage?
    private var datamanager: DataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderTable()
        configureTable()
    }

    private func findCommunityName(communityID: Int) -> String {
        let communities = datamanager.getCommunities()
        let community = communities.filter { $0.communityID == communityID}.first

        return community?.communityName ?? ""
    }

    private func configureHeaderTable() {
        if let post = self.post {

            let communityName = findCommunityName(communityID: post.communityID)

            headerTable.configure(userImage: post.authorImageName, userName: post.authorName, postTitle: post.title, postContent: post.description, communityName: communityName)
            headerTable.delegate = self
        }
    }

    private func configureTable() {
        let tableCellNib = UINib(nibName: ViewPostCellTable.nibName, bundle: nil)
        table.register(tableCellNib, forCellReuseIdentifier: ViewPostCellTable.identifier)

        table.allowsSelection = false
        table.separatorStyle = .none
    }
}

extension ViewPostTable: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewPostCellTable.identifier, for: indexPath) as? ViewPostCellTable else {
            fatalError("erro na cel")
        }

        guard let post = self.post else {
            return UITableViewCell()
        }

        let comment = post.comments[indexPath.row]
        let user = datamanager.getAuthorOfPost(userIdentifier: comment.personID)

        cell.configure(with: comment, and: user)
        cell.backgroundColor = .defaultWhite
        cell.delegate = self

        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let view = UIView()
            view.backgroundColor = .defaultWhite
            return view
    }
}

extension ViewPostTable: ViewPostDelegate {
    func callManageComment() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Denunciar", style: .destructive)

        let saveAction = UIAlertAction(title: "Marcar como util", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }

    func callManageHeader() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Denunciar", style: .destructive)

        let saveAction = UIAlertAction(title: "Salvar", style: .default)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }
}
