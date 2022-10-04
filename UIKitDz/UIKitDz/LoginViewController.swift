//
//  LoginViewController.swift
//  UIKitDz
//
//  Created by angelina on 04.10.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(1, forKey: "password")
        defaults.set(11, forKey: "email")
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "appVC" {
            guard let emailUser = emailTextField.text,
                  let passwordUser = passwordTextfield.text,
                  emailUser == String(defaults.integer(forKey: "email")),
                  passwordUser == String(defaults.integer(forKey: "password")) else { return false }
            return true
        }
        return true
    }

    @IBAction func nextScreenAction(_ sender: Any) {
    }
}
