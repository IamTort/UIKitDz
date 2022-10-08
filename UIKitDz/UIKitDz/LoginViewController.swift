//
//  LoginViewController.swift
//  UIKitDz
//
//  Created by angelina on 04.10.2022.
//

import UIKit
/// Контроллер входа
final class LoginViewController: UIViewController {

    enum Constants {
        static let identifier = "appVC"
        static let passwordKey = "password"
        static let emailKey = "email"
    }

    // MARK: - Private IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public method
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.identifier {
            guard let emailUser = emailTextField.text,
                  let passwordUser = passwordTextfield.text,
                  emailUser == UserDefaults.standard.string(forKey: "email"),
                  passwordUser == UserDefaults.standard.string(forKey: "password")
            else {
                let alertVC = UIAlertController(title: "Такого пользователя не существует!",
                    message: "Введите правильный логин и пароль", preferredStyle: .alert)
                let okAlertAction = UIAlertAction(title: "ok", style: .default)
                alertVC.addAction(okAlertAction)
                present(alertVC, animated: true)
                return false }
            return true
        }
        return true
    }
}
