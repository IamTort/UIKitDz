//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// Стартовый экран
final class StartViewController: UIViewController {
// MARK: - Private Properties
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
    
    private lazy var notificationLabel: UILabel = {
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
        button.addTarget(self, action: #selector(additionAction(paramTarget:)), for: .touchUpInside)
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
        button.setTitle("Игра \"Угадай\n число\"", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: 20, y: 240, width: 140, height: 80)
        button.addTarget(self, action: #selector(findNumberAction(paramTarget:)), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(tryToFindNumberAction(paramTarget:)), for: .touchUpInside)
        return button
    }()
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alertGreetings()
    }
// MARK: - Methods
    func setupUI() {
        view.addSubview(notificationLabel)
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
        present(greetingAlertController, animated: true)
    }
// MARK: - Actions
    @objc func additionAction(paramTarget: UIButton) {
        let additionAlertController = UIAlertController(title: "Сложение",
                                                        message: "Введи 2 значения",
                                                        preferredStyle: .alert)
        additionAlertController.addTextField()
        additionAlertController.addTextField()
        let resultAlertAction = UIAlertAction(title: "Результат", style: .default) { _ in
            guard
                let firstTerm = Int(additionAlertController.textFields?[0].text ?? ""),
                let secondTerm = Int(additionAlertController.textFields?[1].text ?? "")
            else { return }
            self.resultLabel.text? = "Результат: " + String(firstTerm + secondTerm)
        }
        additionAlertController.addAction(resultAlertAction)
        present(additionAlertController, animated: true)
    }
    
    @objc func findNumberAction(paramTarget: UIButton) {
        tryButton.isHidden = false
        findNumberTextField.isHidden = false
        findNumberTextField.text = ""
        rightNumber = Int.random(in: 0...100)
    }
    
    @objc func tryToFindNumberAction(paramTarget: UIButton) {
        guard let enteredNumber = Int(findNumberTextField.text ?? "") else { return }
        switch enteredNumber {
        case rightNumber:
            notificationLabel.text = "Угадал!"
            findNumberTextField.isHidden = false
            tryButton.isHidden = false
        case ...rightNumber:
            notificationLabel.text = "больше"
        case rightNumber...:
            notificationLabel.text = "меньше"
        default: break
        }
    }
}
