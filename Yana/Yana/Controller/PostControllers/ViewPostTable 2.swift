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
    
    private var comments: [Comment] = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerTable.configure()
        createComments()
        configureTable()
    }

    private func configureTable() {
        let tableCellNib = UINib(nibName: ViewPostCellTable.nibName, bundle: nil)
        table.register(tableCellNib, forCellReuseIdentifier: ViewPostCellTable.identifier)
    }

    private func createComments() {
        comments.append( Comment(userImage: "", userName: "Fulano de tal", userComment: "Hey man, compra um farol dahora que ele vai gostar, boto fé. #TMJ!"))

        comments.append( Comment(userImage: "", userName: "Tal de Fulano", userComment: "Que absurdo! nessa idade? poe o muleke numa moto né mano. #Fe"))

        comments.append( Comment(userImage: "", userName: "Senhor fulano", userComment: "Com essa idade meu filho fez A/B, entao dei uma moto, concordo com o @Tal de Fulano. #Segue"))
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

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let view = UIView()
            view.backgroundColor = .clear
            return view
    }
}
