//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController
class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var familyTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.tag = 0
        familyTextfield.tag = 1
        nameTextfield.tag = 2
        passwordTextfield.tag = 3
        repeatPasswordTextfield.tag = 4
        emailTextfield.delegate = self
        familyTextfield.delegate = self
        nameTextfield.delegate = self
        passwordTextfield.delegate = self
        repeatPasswordTextfield.delegate = self
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = 0.0
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0...3:
            if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            }
        case 4:
            textField.resignFirstResponder()
        default:
            break
        }
        return false
    }
}
