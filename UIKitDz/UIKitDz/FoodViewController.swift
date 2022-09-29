//
//  FoodViewController.swift
//  UIKitDz
//
//  Created by angelina on 28.09.2022.
//

import UIKit
/// Контроллер выбора еды
final class FoodViewController: UIViewController {
// MARK: - Private properties
    private lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Пицца"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.frame = CGRect(x: 20, y: 140, width: 350, height: 100)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        return label
    }()

    private lazy var sushiLabel: UILabel = {
        let label = UILabel()
        label.text = "Cуши"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.frame = CGRect(x: 20, y: 270, width: 350, height: 100)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        return label
    }()

    private lazy var pizzaButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.plain())
        button.frame = CGRect(x: 20, y: 140, width: 350, height: 100)
        button.addTarget(self, action: #selector(pizzaButtonAction(_:)), for: .touchUpInside)
        return button
    }()
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
// MARK: - Public methods
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationItem.title = "Food"
        view.addSubview(pizzaLabel)
        view.addSubview(sushiLabel)
        view.addSubview(pizzaButton)
    }
// MARK: - Actions
    @objc private func pizzaButtonAction(_ sender: UIButton) {
        let pizzaVC = ChoosePizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: false)
    }
}
