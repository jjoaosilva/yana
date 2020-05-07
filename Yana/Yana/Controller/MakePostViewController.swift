//
//  MakePostViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class MakePostViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Propeties

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
    @IBOutlet weak var titlePage: UINavigationItem!

    // MARK: - Initializations

    override func viewDidLoad() {
        super.viewDidLoad()
        postTitle.delegate = self
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = true
        }
        layoutSettings()
        updateSaveButtonState()

        //On-screen keyboard configuration
        NotificationCenter.default.addObserver(self,
        selector: #selector(keyboardWillShow), name:
        UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self,
        selector: #selector(keyboardWillHide), name:
        UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Keyboard properties

    @objc func keyboardWillShow(notification: NSNotification) {
        if [postContent .isFirstResponder][0] {
            if let keyboardSize = (notification.userInfo?[
                UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    // MARK: - Actions

    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Navigation

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //MARK: UITextFieldDelegate

    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Desativa o botao save enquanto essa opcao esta ativa
        doneButtonBar.isEnabled = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Esconde o keyboard
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        //Verifica se o nome esta vazio
        updateSaveButtonState()
    }

    // MARK: - Methods

    // Adjusts the layout of the page parameters
    private func layoutSettings() {
        view.backgroundColor = .defaultWhite

        nameUser.textColor = .primaryColor

        plusMediaLabel.textColor = .primaryColor
        plusMediaButton.tintColor = .primaryColor
        plusCommunityLabel.textColor = .primaryColor
        plusCommunityButton.tintColor = .primaryColor

        imageUser.tintColor = .primaryColor

        cancelButtonBar.tintColor = .primaryColor
        doneButtonBar.tintColor = .primaryColor
        navigationItem.title = "Post"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.primaryColor]

        postTitle.backgroundColor = .defaultWhite
        postTitle.borderColor = .primaryColor
        postTitle.borderWidth = 1
        postTitle.cornerRadius = 10
        postTitle.textColor = .primaryColor

        postContent.backgroundColor = .defaultWhite
        postContent.layer.borderColor = UIColor.primaryColor.cgColor
        postContent.layer.borderWidth = 1
        postContent.layer.cornerRadius = 10
        postContent.textColor = .primaryColor

        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = imageUser.bounds.width / 2
    }

    private func updateSaveButtonState() {

        //Desativa o botao salvar se o campo de texto estiver vazio
        let titleText = postTitle.text ?? ""
        doneButtonBar.isEnabled = !titleText.isEmpty
    }
}
