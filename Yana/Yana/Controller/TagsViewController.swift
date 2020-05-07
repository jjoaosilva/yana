//
//  TagsViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {

    @IBOutlet weak var firstCommunityImage: UIImageView!
    @IBOutlet weak var firstCommunityName: UILabel!
    @IBOutlet weak var secondCommunityImage: UIImageView!
    @IBOutlet weak var secondCommunityName: UILabel!
    @IBOutlet weak var thirdCommunityImage: UIImageView!
    @IBOutlet weak var thirdCommunityName: UILabel!
    @IBOutlet weak var fourthCommunityImage: UIImageView!
    @IBOutlet weak var fourthCommunityName: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!

    private let dataManager: DataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        configure()
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        print("1")
    }

    @IBAction func secondButtonTapped(_ sender: UIButton) {
        print("2")
    }

    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        print("3")
    }

    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        print("4")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let community: [PostPackage]

        switch segue.identifier ?? "" {
        case "firstButton":
            community = dataManager.getAllActivitiesCommunity(identifier: 1)
        case "secondButton":
            community = dataManager.getAllActivitiesCommunity(identifier: 2)
        case "thirdButton":
            community = dataManager.getAllActivitiesCommunity(identifier: 3)
        case "fourthButton":
            community = dataManager.getAllActivitiesCommunity(identifier: 4)
        default:
            community = dataManager.getAllActivitiesCommunity(identifier: 1)
        }

        guard let communityProfile = segue.destination as? CommunityProfileTableViewController else {
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }

        communityProfile.infocommunity = community
    }

    private func configure() {
        let communities = dataManager.getCommunities()
        firstCommunityImage.image = UIImage(named: communities[0].imageNameBackground)
        firstCommunityName.text = communities[0].communityName

        secondCommunityImage.image = UIImage(named: communities[1].imageNameBackground)
        secondCommunityName.text = communities[1].communityName

        thirdCommunityImage.image = UIImage(named: communities[2].imageNameBackground)
        thirdCommunityName.text = communities[2].communityName

        fourthCommunityImage.image = UIImage(named: communities[3].imageNameBackground)
        fourthCommunityName.text = communities[3].communityName
    }

    private func layoutSettings() {
        firstCommunityImage.backgroundColor  = .defaultGray
        firstCommunityImage.layer.cornerRadius = firstCommunityImage.bounds.width / 2
        firstCommunityImage.layer.masksToBounds = true
        firstCommunityImage.layer.borderWidth = 1
        firstCommunityImage.layer.borderColor = UIColor.primaryColor.cgColor
        firstButton.layer.cornerRadius =  firstCommunityImage.bounds.width / 2

        secondCommunityImage.backgroundColor = .defaultGray
        secondCommunityImage.layer.cornerRadius = secondCommunityImage.bounds.width / 2
        secondCommunityImage.layer.masksToBounds = true
        secondCommunityImage.layer.borderWidth = 1
        secondCommunityImage.layer.borderColor = UIColor.primaryColor.cgColor
        secondButton.layer.cornerRadius =  secondCommunityImage.bounds.width / 2

        thirdCommunityImage.backgroundColor  = .defaultGray
        thirdCommunityImage.layer.cornerRadius = thirdCommunityImage.bounds.width / 2
        thirdCommunityImage.layer.masksToBounds = true
        thirdCommunityImage.layer.borderWidth = 1
        thirdCommunityImage.layer.borderColor = UIColor.primaryColor.cgColor
        thirdButton.layer.cornerRadius =  thirdCommunityImage.bounds.width / 2

        fourthCommunityImage.backgroundColor = .defaultGray
        fourthCommunityImage.layer.cornerRadius = fourthCommunityImage.bounds.width / 2
        fourthCommunityImage.layer.masksToBounds = true
        fourthCommunityImage.layer.borderWidth = 1
        fourthCommunityImage.layer.borderColor = UIColor.primaryColor.cgColor
        fourthButton.layer.cornerRadius =  fourthCommunityImage.bounds.width / 2
    }
//    @IBAction func communityProfileButton(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "CommunityProfile", sender: nil)
//
//    }
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let destination = segue.destination as? UINavigationController
//        _ =  destination!.topViewController! as? CommunityProfileViewController
//    }

}
