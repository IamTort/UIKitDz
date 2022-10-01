//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// Контроллер для входа в систему
final class LoginViewController: UIViewController {

    // MARK: - Private properties
    private lazy var loginImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "cloud.fill"))
        imageView.frame = CGRect(x: UIScreen.main.bounds.width / 3, y: 140, width: 140, height: 80)
        imageView.tintColor = .systemGray2
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bringo"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        label.center = loginImageView.center
        label.clipsToBounds = true
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.frame = CGRect(x: 40, y: 330, width: 200, height: 20)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldOne: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите телефон"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 40, y: 360, width: 200, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.keyboardType = .numberPad
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 40, y: 390, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.frame = CGRect(x: 40, y: 420, width: 200, height: 20)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldTwo: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите email"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 40, y: 450, width: 200, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.isSecureTextEntry = true
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var lineTwoView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 40, y: 480, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.alpha = 0.4
        button.frame = CGRect(x: 40, y: 630, width: 300, height: 40)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedAction(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(loginImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(textfieldOne)
        view.addSubview(lineView)
        view.addSubview(passwordLabel)
        view.addSubview(textfieldTwo)
        view.addSubview(lineTwoView)
        view.addSubview(loginButton)
    }

    // MARK: - Private Actions
    @objc private func tappedAction(_ sender: UIButton) {
        let foodVC = FoodViewController()
        let navController = UINavigationController(rootViewController: foodVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}
