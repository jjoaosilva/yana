//
//  ViewPostHeaderTable.swift
//  Yana
//
//  Created by Jose Joao Silva Nunes Alves on 29/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class ViewPostHeaderTable: UIView {

    var nibName = "ViewPostHeaderTable"
    var contentView: UIView?
    weak var delegate: ViewPostDelegate?

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var tagPost: UILabel!
    @IBOutlet weak var managePost: UIButton!
    @IBOutlet weak var utilPost: UIButton!
    @IBOutlet weak var commentPost: UIButton!
    @IBOutlet weak var savePost: UIButton!
    @IBOutlet weak var labelView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
        layoutSettings()
    }

    @IBAction func managePostTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.callManageHeader()
        }
    }

    func configure() {
        userName.text = "Joao da quebrada"
        postTitle.text = "Meu filho cresceu???"
        postContent.text = """
        Meu filho tem apenas 6 anos de idade e ja tirou sua carteira
        de motorista e ja financiou um carro. O que eu faco????
        """
    }

    private func setupXib() {
        guard let view = loadViewFromNib() else {
            fatalError("Wrong xib name")
        }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func layoutSettings() {
        contentView?.backgroundColor = .defaultWhite
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        userImage.backgroundColor = .defaultGray
        userName.textColor = .primaryColor

        postTitle.textColor = .primaryColor
        postTitle.font = UIFont.bellotaTitle
        postContent.textColor = .primaryColor

        tagPost.textColor = .defaultWhite

        labelView.backgroundColor = .primaryColor
        labelView.layer.cornerRadius = 5
        labelView.layer.masksToBounds = true

        managePost.backgroundColor = .primaryColor
        utilPost.backgroundColor = .primaryColor
        commentPost.backgroundColor = .primaryColor
        savePost.backgroundColor = .primaryColor
    }
}
