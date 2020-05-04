//
//  OnboardingContentViewController.swift
//  Yana
//
//  Created by Anderson Alencar on 30/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentDescription: UILabel!

    // MARK: - Properties
    var index = 0
    var presentationData: (title: String, description: String, imageName: String) = ("", "", "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .defaultBkg
        contentImage.image = UIImage(named: presentationData.imageName)
        contentTitle.text = presentationData.title
        contentDescription.text = presentationData.description
    }

    func configLabels() {
        contentTitle.textColor = .defaultBlack
        contentDescription.textColor = .defaultBlack
    }
}
