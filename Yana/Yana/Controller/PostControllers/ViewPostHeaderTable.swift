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

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postTile: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var managePost: UIButton!
    @IBOutlet weak var utilPost: UIButton!
    @IBOutlet weak var commentPost: UIButton!
    @IBOutlet weak var savePost: UIButton!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }

    func configure(){
        userName.text = "Joao da quebrada"
        postTile.text = "Meu filho cresceu???"
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
}
