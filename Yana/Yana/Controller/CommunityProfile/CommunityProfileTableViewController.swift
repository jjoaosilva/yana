//
//  CommunityProfileTableViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityProfileTableViewController: UITableViewController {

    // MARK: - Propeties

    @IBOutlet weak var imageCommunity: UIImageView!
    @IBOutlet weak var tagCommunity: UILabel!
    @IBOutlet weak var peopleTalkLabel: UILabel!
    @IBOutlet weak var optionsChoise: UISegmentedControl!
    @IBOutlet weak var plusPostButton: UIBarButtonItem!
    @IBOutlet weak var searchField: FormTextField!
    @IBOutlet weak var viewTable: UIView!

    let manager = DataManager()
    var infocommunity = [PostPackage]()
    var communityID: Int?

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        setInformationsCommunity()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infocommunity.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Identificador na storyboard
        let cellIdentifier = "CommunityProfileTableViewCell"

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath) as?
            CommunityProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        cell.postContent.text = infocommunity[indexPath.row].description
        cell.imageUser.image = UIImage(named: infocommunity[indexPath.row].authorImageName)
        cell.userName.text = infocommunity[indexPath.row].authorName
        cell.titlePost.text = infocommunity[indexPath.row].title

        return cell
    }

    // MARK: - Navigation

    func setInformationsCommunity() {
        guard let ids = communityID, let community = findCommunity(communityID: ids) else {
            fatalError("erro")
        }
        imageCommunity.image = UIImage(named: community.imageNameBackground)
        tagCommunity.text = community.communityName
        peopleTalkLabel.text = "\(community.numberFollowers) pessoas falando sobre isso"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)

        switch (segue.identifier ?? "") {
        case "makePost":
            guard let navigation = segue.destination as? UINavigationController else {                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
            //Obtem o viewcontroller de destino
            guard let makePostViewController = navigation.topViewController as? MakePostViewController else {
                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
            makePostViewController.community = tagCommunity.text
        case "viewPost":
            //Obtem o viewcontroller de destino
            guard let postDetailViewController = segue.destination as? ViewPostTable else {
                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
            //Obtem a celula selecionada
            guard let selectedPostCell = sender as? CommunityProfileTableViewCell else {
                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
            //Obtem o caminho do indice da celula selecionadax
            guard let indexPath = tableView.indexPath(for: selectedPostCell) else {
                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
            //Procura esse caminho no array de objetos de meals
            let selectedPost = infocommunity[indexPath.row]
            //Exibicao de destino
            postDetailViewController.post = selectedPost
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

    // MARK: - Private functions

    private func layoutSettings() {
        viewTable.backgroundColor = .defaultWhite

        tagCommunity.textColor = .primaryColor
        tagCommunity.font = .bellotaTitle

        peopleTalkLabel.textColor = .primaryColor
        peopleTalkLabel.font = .bellotaTag

        plusPostButton.tintColor = .primaryColor
        self.navigationController?.navigationBar.tintColor = .primaryColor

        searchField.textColor = .primaryColor
        searchField.tintColor = .primaryColor
        searchField.paddingLeft = CGFloat(15)
        searchField.placeholder = "Pesquisar"
        searchField.placeholderColor = .primaryColor
        searchField.backgroundColor = .defaultWhite
        searchField.layer.borderColor = UIColor.primaryColor.cgColor
        searchField.layer.borderWidth = 2
        searchField.layer.cornerRadius = 10

        if #available(iOS 13.0, *) {
            optionsChoise.selectedSegmentTintColor = .primaryColor
            optionsChoise.backgroundColor = .secondaryColor
        } else {
            optionsChoise.tintColor = .primaryColor
            optionsChoise.backgroundColor = .secondaryColor
        }
        optionsChoise.backgroundColor = .secondaryColor

        imageCommunity.layer.masksToBounds = true
        imageCommunity.layer.cornerRadius = imageCommunity.bounds.width / 2
    }

    private func findCommunity(communityID: Int) -> Community? {
        let communities = manager.getCommunities()
        let community = communities.filter { $0.communityID == communityID}.first

        return community
    }
}
