//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController
final class ViewController: UIViewController {
    private var rightNumber = 0
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет, "
        label.textAlignment = .center
        label.frame = CGRect(x: 20, y: 80, width: 260, height: 25)
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    private lazy var notification: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textAlignment = .left
        label.frame = CGRect(x: 180, y: 250, width: 100, height: 25)
        return label
    }()
    private lazy var additionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitle("Сложить числа", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: 20, y: 160, width: 140, height: 60)
        button.addTarget(self, action: #selector(addition(paramTarget:)), for: .touchUpInside)
        return button
    }()
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.frame = CGRect(x: 180, y: 170, width: 120, height: 40)
        label.text = "Результат: "
        return label
    }()
    private lazy var findNumberButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitle("Игра \"Угадай число\"", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: 20, y: 240, width: 140, height: 70)
        button.addTarget(self, action: #selector(findNumber(paramTarget:)), for: .touchUpInside)
        return button
    }()
    private lazy var findNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите число от 0 до 100"
        textField.frame = CGRect(x: 20, y: 320, width: 250, height: 80)
        textField.isHidden = true
        return textField
    }()
    private lazy var tryButton: UIButton = {
        let button =  UIButton(configuration: .filled())
        button.setTitle("Применить", for: .normal)
        button.frame = CGRect(x: 20, y: 400, width: 140, height: 40)
        button.isHidden = true
        button.addTarget(self, action: #selector(tryToFindNumber(paramTarget:)), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        alertGreetings()
    }
    func setupUI() {
        view.addSubview(notification)
        view.addSubview(nameLabel)
        view.addSubview(additionButton)
        view.addSubview(resultLabel)
        view.addSubview(findNumberButton)
        view.addSubview(findNumberTextField)
        view.addSubview(tryButton)
    }
    func alertGreetings() {
        let greetingAlertController = UIAlertController(title: "Привет",
                                                        message: "Введи своё имя",
                                                        preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) { _ in
            self.nameLabel.text? += greetingAlertController.textFields?.first?.text ?? ""
        }
        greetingAlertController.addTextField()
        greetingAlertController.addAction(okAlertAction)
        self.present(greetingAlertController, animated: true)
    }
    @objc func addition(paramTarget: UIButton) {
        let additionAlertController = UIAlertController(title: "Сложение",
                                                        message: "Введи 2 значения",
                                                        preferredStyle: .alert)
        additionAlertController.addTextField()
        additionAlertController.addTextField()
        let resultAlertAction = UIAlertAction(title: "Результат", style: .default) { _ in
            guard let firstTerm = Int(additionAlertController.textFields?[0].text ?? "") else { return }
            guard let secondTerm = Int(additionAlertController.textFields?[1].text ?? "") else { return }
            self.resultLabel.text? = "Результат: " + String(firstTerm + secondTerm)
        }
        additionAlertController.addAction(resultAlertAction)
        self.present(additionAlertController, animated: true)
    }
    @objc func findNumber(paramTarget: UIButton) {
        self.tryButton.isHidden = false
        self.findNumberTextField.isHidden = false
        self.findNumberTextField.text = ""
        self.rightNumber = Int.random(in: 0...100)
        print(rightNumber)
    }
    @objc func tryToFindNumber(paramTarget: UIButton) {
        guard let enteredNumber = Int(findNumberTextField.text ?? "") else { return }
        switch enteredNumber {
        case rightNumber:
            notification.text = "Угадал!"
            findNumberTextField.isHidden = false
            tryButton.isHidden = false
        case ...rightNumber:
            notification.text = "больше"
        case rightNumber...:
            notification.text = "меньше"
        default: break
        }
    }
}
