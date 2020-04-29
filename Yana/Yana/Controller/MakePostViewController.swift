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
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var plusCommunityButton: UIButton!
    @IBOutlet weak var postContent: UITextView!
    @IBOutlet weak var plusMediaButton: UIButton!
    @IBOutlet weak var plusCommunityLabel: UILabel!
    @IBOutlet weak var plusMediaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = true
        }
        setupColors()
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = imageUser.bounds.width / 2
        
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
    }
    @IBAction func postTittle(_ sender: UITextField) {
        view.endEditing(false)
    }
}
