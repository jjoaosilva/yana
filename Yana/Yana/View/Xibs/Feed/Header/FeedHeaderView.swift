//
//  FeedHeaderView.swift
//  Yana
//
//  Created by Pedro Sousa on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class FeedHeaderView: UIView {

    var nibName: String = "FeedHeader"
    var contentView: UIView?

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var postField: FormTextField!
    @IBOutlet weak var divider: UIView!

    override func draw(_ rect: CGRect) {
        picture.layer.cornerRadius = 15
        divider.backgroundColor = .primaryColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }

    public func setupXib() {
        guard let view = loadViewFromNib() else { fatalError("Wrong xib name") }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    public func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
