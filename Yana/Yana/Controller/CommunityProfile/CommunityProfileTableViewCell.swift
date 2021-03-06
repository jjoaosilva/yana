//
//  CommunityProfileTableViewCell.swift
//  Yana
//
//  Created by Ronaldo Gomes on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityProfileTableViewCell: UITableViewCell {

    // MARK: - Propeties

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var postContent: UITextView!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSettings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Private Methods

    private func layoutSettings() {
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = self.imageUser.bounds.width / 2

        userName.textColor = .defaultBlack
        titlePost.textColor = .defaultBlack

        postContent.adjustsFontForContentSizeCategory = true
        postContent.allowsEditingTextAttributes = false
        postContent.isEditable = false
        postContent.textColor = .defaultBlack
    }

}
