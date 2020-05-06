//
//  CommunityProfileTableViewCell.swift
//  Yana
//
//  Created by Ronaldo Gomes on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var postContent: UITextView!

//    var titulo: String = "Titulo" {
//        didSet {
//            titlePost.text = titulo
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSettings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func layoutSettings() {
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = self.imageUser.bounds.width / 2

        userName.textColor = .primaryColor
        titlePost.textColor = .primaryColor

        postContent.adjustsFontForContentSizeCategory = true
        postContent.allowsEditingTextAttributes = false
        postContent.isEditable = false
        postContent.textColor = .primaryColor
    }

}
