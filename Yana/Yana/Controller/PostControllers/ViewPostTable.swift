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

    private var comments: [Comment1] = [Comment1]()
    private var manage: DataManager = DataManager()
    var post: PostPackage?

    override func viewDidLoad() {
        super.viewDidLoad()
        createComments()
        configureHeaderTable()
        configureTable()
        print(post)
    }

    private func configureHeaderTable() {
        headerTable.configure()
        headerTable.delegate = self
    }

    private func configureTable() {
        let tableCellNib = UINib(nibName: ViewPostCellTable.nibName, bundle: nil)
        table.register(tableCellNib, forCellReuseIdentifier: ViewPostCellTable.identifier)

        table.allowsSelection = false
        table.separatorStyle = .none

    }

    private func createComments() {
        comments.append( Comment1(userImage: "", userName: "Fulano de tal", userComment: "Hey man, compra um farol dahora que ele vai gostar, boto fé. #TMJ!"))

        comments.append( Comment1(userImage: "", userName: "Tal de Fulano", userComment: "Que absurdo! nessa idade? poe o muleke numa moto né mano. #Fe"))

        comments.append( Comment1(userImage: "", userName: "Senhor fulano", userComment: "Com essa idade meu filho fez A/B, entao dei uma moto, concordo com o @Tal de Fulano. #Segue"))
    }
}

extension ViewPostTable: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewPostCellTable.identifier, for: indexPath) as? ViewPostCellTable else {
            fatalError("erro na cel")
        }

        let comment = comments[indexPath.row]
        cell.configure(with: comment)
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
