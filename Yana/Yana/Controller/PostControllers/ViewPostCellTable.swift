//
//  ViewPostCellTable.swift
//  Yana
//
//  Created by Jose Joao Silva Nunes Alves on 30/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

struct Comment {
    var userImage: String
    var userName: String
    var userComment: String
}

class ViewPostCellTable: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var manageComment: UIButton!

    static let nibName = "ViewPostCellTable"
    static let identifier =  "ViewPostCellTable"

    override func prepareForReuse() {
        userImage.image = nil
        userName.text = nil
        userComment.text = nil
    }

    func configure(with comment: Comment) {
        userImage.image = UIImage(named: comment.userImage)
        userName.text = comment.userName
        userComment.text = comment.userComment
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        userImage.backgroundColor = .defaultGray
        userName.textColor = .defaultBlack
        userComment.textColor = .defaultBlack
    }
}
