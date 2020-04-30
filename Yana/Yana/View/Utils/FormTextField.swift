//
//  FormInputField.swift
//  Yana
//
//  Created by Pedro Sousa on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

@IBDesignable class FormTextField: UITextField {

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

    // Inner Spacing (Padding) Settings
    // Default Padding
    private var padding: [CGFloat] = [0, 0, 0, 0]
    // Attributes
    @IBInspectable var paddingTop: CGFloat = 0 {
        didSet { padding[0] = paddingTop }
    }
    @IBInspectable var paddingLeft: CGFloat = 0 {
        didSet { padding[1] = paddingLeft }
    }
    @IBInspectable var paddingBottom: CGFloat = 0 {
        didSet { padding[2] = paddingBottom }
    }
    @IBInspectable var paddingRight: CGFloat = 0 {
        didSet { padding[3] = paddingRight }
    }
    // UIEdgeInset Object
    private func getPadding() -> UIEdgeInsets {
        return UIEdgeInsets(top: padding[0], left: padding[1], bottom: padding[2], right: padding[3])
    }

    // Overrided Inner Spacing Functions
    // Field Content
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.getPadding())
    }
    // Placeholder Field
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.getPadding())
    }
    // Field While Editing
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.getPadding())
    }

    // Placehoder Settings
    // Placeholder Color
    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
}
