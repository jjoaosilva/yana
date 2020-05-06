//
//  RecentActivitySectionHeaderView.swift
//  Yana
//
//  Created by Pedro Sousa on 06/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class RecentActivitySectionHeader: UITableViewHeaderFooterView {

    static let nibName: String = "RecentActivitySectionHeader"
    static let identifier: String = "sectionHeader"

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var background: UIView!

    override func draw(_ rect: CGRect) {
        title.text = "Últimas Atividades"
        title.font = .bellotaHeader
        title.textColor = .primaryColor
    }
}
