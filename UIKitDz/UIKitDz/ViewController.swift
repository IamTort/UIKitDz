//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// /// Controller for login
class ViewController: UIViewController {

    private lazy var birthdayReminder: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: 140, width: 200, height: 80)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        return label
    }()

    private lazy var sign: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .left
        label.frame = CGRect(x: 40, y: 260, width: 200, height: 60)
        label.font = UIFont(name: "Futura", size: 25)
        label.clipsToBounds = true
        return label
    }()

    private lazy var email: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.frame = CGRect(x: 40, y: 330, width: 200, height: 20)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldOne: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите email"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 40, y: 360, width: 200, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 40, y: 390, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var password: UILabel = {
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

    private lazy var lineTwo: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 40, y: 480, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var enter: UILabel = {
        let label = UILabel()
        label.text = "Вход по Face ID"
        label.textAlignment = .center
        label.frame = CGRect(x: UIScreen.main.bounds.width / 5, y: 540, width: 200, height: 40)
        label.font = UIFont(name: "Futura", size: 17)
        label.clipsToBounds = true
        return label
    }()

    private lazy var switc: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.frame = CGRect(x: 265, y: 543, width: 20, height: 20)
        switcher.clipsToBounds = true
        return switcher
    }()

    private lazy var login: UIButton = {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(birthdayReminder)
        view.addSubview(sign)
        view.addSubview(email)
        view.addSubview(textfieldOne)
        view.addSubview(line)
        view.addSubview(password)
        view.addSubview(textfieldTwo)
        view.addSubview(lineTwo)
        view.addSubview(enter)
        view.addSubview(switc)
        view.addSubview(login)
    }

    @objc func tappedAction(_ sender: UIButton) {
        let birthdayVC = BirthdayViewController()
        navigationController?.pushViewController(birthdayVC, animated: false)
    }
}
