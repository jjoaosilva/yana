//
//  CommunityTableViewCell.swift
//  Yana
//
//  Created by Pedro Sousa on 06/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class CommunityTableViewCell: UITableViewCell {
    static let nibName = "CommunityTableViewCell"
    static let identifier = "communityCell"

    static let dataManager: DataManager = DataManager()
    var posts: [PostPackage] = []
    var community: Community?

    weak var delegate: FeedViewController?

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var recentPosts: UICollectionView!

    override func draw(_ rect: CGRect) {
        self.tagName.textColor = .primaryColor

        self.picture.layer.cornerRadius = self.picture.bounds.height / 2

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 20,
            bottom: 0,
            right: 20)
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .horizontal
        recentPosts.collectionViewLayout = layout
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        self.tagName.addGestureRecognizer(tap)

        self.tagName.isUserInteractionEnabled = true

        self.recentPosts.delegate = self
        self.recentPosts.dataSource = self

        let collectionCellNib = UINib(
            nibName: PostCollectionViewCell.nibName,
            bundle: nil)
        self.recentPosts.register(
                collectionCellNib,
                forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }

    @objc private func click() {
        if let del = delegate {
            del.goToCommunity(identifier: community!.communityID)
        }
    }

    public func currentCommunity(value: Int) {
        let lastPosts = CommunityTableViewCell.dataManager.getAllActivitiesCommunity(identifier: value)
        posts.append(contentsOf: lastPosts)
    }

    public func configure(community: Community) {
        self.community = community
        self.tagName.text = "#\(community.communityName)"
        self.tagName.font = .bellotaTag

        self.picture.image = UIImage(named: community.imageNameBackground)

        self.currentCommunity(value: community.communityID)
    }

    override func prepareForReuse() {
        self.tagName.text = ""
        self.picture.image = nil
        posts = []
    }
}

extension CommunityTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        cell.delegate = self.delegate
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 104)
    }
}
