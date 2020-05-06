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

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var picture: UIView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var postTitle: UILabel!

    var image: UIImage? {
        didSet {
            if let img = image {
                let imageView = UIImageView(image: img)
                picture.addSubview(imageView)

                picture.translatesAutoresizingMaskIntoConstraints = false

                imageView.safeAreaLayoutGuide.centerYAnchor.constraint(
                    equalTo: picture.safeAreaLayoutGuide.centerYAnchor
                ).isActive = true
                imageView.safeAreaLayoutGuide.centerXAnchor.constraint(
                    equalTo: picture.safeAreaLayoutGuide.centerXAnchor
                ).isActive = true
            }
        }
    }

    override func draw(_ rect: CGRect) {
        container.backgroundColor = .defaultBkg
        container.layer.cornerRadius = 10
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2

        picture.layer.cornerRadius = picture.bounds.width / 2
        username.font = .systemFont(ofSize: 17, weight: .bold)
        postTitle.font = .systemFont(ofSize: 15)
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(post: Post) {
        self.username.text = User.getUser(userId: post.userId).name
        self.postTitle.text = post.title
    }

    override func prepareForReuse() {
        username.text = ""
        postTitle.text = ""
        for view in picture.subviews {
            view.removeFromSuperview()
        }
    }

}
