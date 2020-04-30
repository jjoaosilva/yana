//
//  FormButton.swift
//  Yana
//
//  Created by Pedro Sousa on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

@IBDesignable class FormButton: UIButton {
    // Border Settings
    // Color
    @IBInspectable var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    // Width
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }
    // Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }

    // Shadow Settings
    // Offset
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet { layer.shadowOffset = shadowOffset }
    }
    // Color (RGB only)
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet { layer.shadowColor = shadowColor.cgColor }
    }
    // Alpha (Opacity)
    @IBInspectable var shadowOpacity: Float = 100 {
        didSet { layer.shadowOpacity = shadowOpacity / 100 }
    }
}
