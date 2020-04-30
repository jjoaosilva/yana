//
//  LoginViewController.swift
//  Yana
//
//  Created by Pedro Sousa on 29/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var inputUser: FormTextField!
    @IBOutlet weak var inputPass: FormTextField!
    @IBOutlet weak var signIn: FormButton!
    @IBOutlet weak var signUp: FormButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
    }

    private func layoutSettings() {
        view.backgroundColor = .secondaryColor

        logo.textColor = .primaryColor
        logo.font = UIFont.bellotaLarge

        inputUser.textColor = .primaryColor
        inputUser.tintColor = .primaryColor
        inputUser.paddingLeft = CGFloat(15)
        inputUser.placeholderColor = .primaryColor
        inputUser.borderColor = .primaryColor
        inputUser.borderWidth = 2
        inputUser.cornerRadius = 10

        inputPass.textColor = .primaryColor
        inputPass.tintColor = .primaryColor
        inputPass.paddingLeft = CGFloat(15)
        inputPass.placeholderColor = .primaryColor
        inputPass.borderColor = .primaryColor
        inputPass.borderWidth = 2
        inputPass.cornerRadius = 10

        signIn.tintColor = .secondaryColor
        signIn.backgroundColor = .primaryColor
        signIn.cornerRadius = 10
        signIn.shadowOffset = CGSize(width: 0, height: 3)
        signIn.shadowOpacity = 20
        signIn.shadowColor = .black

        signUp.backgroundColor = .clear
        signUp.tintColor = .primaryColor
    }
    
    
}
