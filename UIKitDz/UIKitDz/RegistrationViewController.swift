//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// Контроллер регистрации
final class RegistrationViewController: UIViewController {

    enum Constants {
        static let identifier = "afterRegistration"
        static let nilAlertTitle = "Вы заполнили не все поля"
        static let nilAlertMessage = "Проверьте введенные даннные!"
        static let alertButton = "ok"
        static let differentPasswordAlertTitle = "Вы ввели разные пароли!"
        static let differentPasswordAlertMessage = "Проверьте введенные данные!"
        static let passwordKey = "password"
        static let emailKey = "email"
    }

    // MARK: - Private IBOutlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var familyTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTexstfield()
        observerKeyboard()
    }

    // MARK: - Private methods
    private func settingsTexstfield() {
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
    }

    private func observerKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) { (_) in
            self.view.frame.origin.y = 0.0
        }
    }

    // MARK: - method
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.identifier {
            guard let email = emailTextfield.text,
                  let password = passwordTextfield.text,
                  let repeatPassword = repeatPasswordTextfield.text,
                  familyTextfield.text?.isEmpty != true,
                  nameTextfield.text?.isEmpty != true,
                  emailTextfield.text?.isEmpty != true,
                  passwordTextfield.text?.isEmpty != true,
                  repeatPasswordTextfield.text?.isEmpty != true
            else {
                let alertVC = UIAlertController(title: Constants.nilAlertTitle,
                                                message: Constants.nilAlertMessage, preferredStyle: .alert)
                let okAlertAction = UIAlertAction(title: Constants.alertButton, style: .default)
                alertVC.addAction(okAlertAction)
                present(alertVC, animated: true)
                return false }
            guard password == repeatPassword
            else {
                let alertVC = UIAlertController(title: Constants.differentPasswordAlertTitle,
                    message: Constants.differentPasswordAlertMessage, preferredStyle: .alert)
                let okAlertAction = UIAlertAction(title: Constants.alertButton, style: .default)
                alertVC.addAction(okAlertAction)
                present(alertVC, animated: true)
                return false }
            UserDefaults.standard.set(email, forKey: Constants.emailKey)
            UserDefaults.standard.set(password, forKey: Constants.passwordKey)
        }
        return true
    }
}

// MARK: - UITextFieldDelegate + extension
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
