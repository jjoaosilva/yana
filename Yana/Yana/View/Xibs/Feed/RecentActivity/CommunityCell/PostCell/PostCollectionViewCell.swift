//
//  PostCollectionViewCell.swift
//  Yana
//
//  Created by Pedro Sousa on 06/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let nibName = "PostCollectionViewCell"
    static let identifier = "postCell"

    var post: PostPackage?
    weak var delegate: FeedViewController?

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var postTitle: UILabel!

    override func draw(_ rect: CGRect) {
        self.container.backgroundColor = .defaultBkg
        self.container.layer.cornerRadius = 10
        self.container.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.container.layer.shadowColor = UIColor.defaultBlack.cgColor
        self.container.layer.shadowOpacity = 0.2

        self.picture.layer.masksToBounds = true
        self.picture.layer.cornerRadius = self.picture.bounds.width / 2

        self.username.font = .systemFont(ofSize: 17, weight: .bold)

        self.postTitle.font = .systemFont(ofSize: 15)
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let del = delegate {
            del.goToPost(data: post!)
        }
    }

    public func configure(post: PostPackage) {
        self.post = post
        self.username.text = post.authorName
        self.postTitle.text = post.title
        self.picture.image = UIImage(named: post.authorImageName)
    }

    override func prepareForReuse() {
        self.username.text = ""
        self.postTitle.text = ""
        self.picture.image = nil
        self.post = nil
    }
}
