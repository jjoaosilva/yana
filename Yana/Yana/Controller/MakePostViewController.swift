//
//  MakePostViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class MakePostViewController: UIViewController {
    @IBOutlet weak var cancelButtonBar: UIBarButtonItem!
    @IBOutlet weak var doneButtonBar: UIBarButtonItem!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var postTitle: FormTextField!
    @IBOutlet weak var plusCommunityButton: UIButton!
    @IBOutlet weak var plusMediaButton: UIButton!
    @IBOutlet weak var plusCommunityLabel: UILabel!
    @IBOutlet weak var plusMediaLabel: UILabel!
    @IBOutlet weak var postContent: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = true
        }
        setupColors()
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = imageUser.bounds.width / 2
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)


    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        if [postContent .isFirstResponder][0]{
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
    
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        print("keyboardWillHide")
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
        Ajusta as cores dos parametros da pagina, de acordo com as cores
        escolhidas no colors.swift
     */
    func setupColors() {
        view.backgroundColor = .defaultWhite
        nameUser.textColor = .primaryColor
        plusMediaLabel.textColor = .primaryColor
        plusCommunityLabel.textColor = .primaryColor
        plusCommunityButton.tintColor = .primaryColor
        plusMediaButton.tintColor = .primaryColor
        imageUser.tintColor = .primaryColor
        cancelButtonBar.tintColor = .primaryColor
        doneButtonBar.tintColor = .primaryColor
        postTitle.backgroundColor = .defaultWhite
        postContent.backgroundColor = .defaultWhite
        postTitle.borderColor = .primaryColor
        postTitle.borderWidth = 1
        postTitle.cornerRadius = 10
        postContent.layer.borderColor = UIColor.primaryColor.cgColor
        postContent.layer.borderWidth = 1
        postContent.layer.cornerRadius = 10
        
    }
}
