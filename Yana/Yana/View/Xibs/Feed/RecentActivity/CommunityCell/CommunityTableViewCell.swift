//
//  CommunityTableViewCell.swift
//  Yana
//
//  Created by Pedro Sousa on 06/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    static let nibName = "CommunityTableViewCell"
    static let identifier = "communityCell"

    var posts: [Post] = []

    @IBOutlet weak var tagPicture: UIView!
    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var recentPosts: UICollectionView!
    @IBOutlet weak var bkg: UIView!

    var pic: UIImage? {
        didSet {
            if let img = pic {
                let imageView = UIImageView(image: img)
                tagPicture.addSubview(imageView)

                tagPicture.translatesAutoresizingMaskIntoConstraints = false

                imageView.safeAreaLayoutGuide.centerYAnchor.constraint(
                    equalTo: tagPicture.safeAreaLayoutGuide.centerYAnchor
                ).isActive = true
                imageView.safeAreaLayoutGuide.centerXAnchor.constraint(
                    equalTo: tagPicture.safeAreaLayoutGuide.centerXAnchor
                ).isActive = true
            }
        }
    }

    override func draw(_ rect: CGRect) {
        tagName.textColor = .primaryColor
        tagPicture.layer.cornerRadius = tagPicture.bounds.width / 2

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 320, height: 102)
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .horizontal
        recentPosts.collectionViewLayout = layout
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.recentPosts.delegate = self
        self.recentPosts.dataSource = self

        let collectionCellNib = UINib(
            nibName: PostCollectionViewCell.nibName,
            bundle: nil)
        self.recentPosts.register(
                collectionCellNib,
                forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }

    public func getSectionContent(value: Int) {
        posts.append(contentsOf: Post.getPost(tag: value))
    }

    public func configure(tag: Tag) {
        tagName.text = "#\(tag.name)"
        tagName.font = .bellotaTag
        self.getSectionContent(value: tag.tagId)
    }

    override func prepareForReuse() {
        tagName.text = ""

        for view in tagPicture.subviews {
            view.removeFromSuperview()
        }

        for view in recentPosts.subviews {
            view.removeFromSuperview()
        }
    }

    // Delegates and DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostCollectionViewCell.identifier,
            for: indexPath) as? PostCollectionViewCell else {
                fatalError("(PostCollectionViewCell) Wrong xib name")
        }

        let post = posts[indexPath.row]
        cell.configure(post: post)
        return cell
    }
}
