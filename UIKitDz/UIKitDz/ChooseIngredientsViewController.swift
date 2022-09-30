//
//  ChooseIngredientsViewController.swift
//  UIKitDz
//
//  Created by angelina on 28.09.2022.
//

import UIKit

/// Протокол добавления метода делегата
protocol DelegateViewController: AnyObject {
    func goToRootViewController()
}

/// Контроллер выбора ингредиентов
final class ChooseIngredientsViewController: UIViewController {

    // MARK: - Private properties
    private lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        return label
    }()

    private lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var nextScreenButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.tintColor = .orange
        button.setTitle("Выбрать", for: .normal)
        button.addTarget(self, action: #selector(nextScreenAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 650, width: 300, height: 50)
        return button
    }()

    private lazy var mozzarellaLabel = createLabel(title: "Cыр моцарела", coordinateY: 430)
    private lazy var hamLabel = createLabel(title: "Ветчина", coordinateY: 480)
    private lazy var mushroomsLabel = createLabel(title: "Грибы", coordinateY: 530)
    private lazy var oliveLabel = createLabel(title: "Маслины", coordinateY: 580)

    private lazy var mozzarellaSwitch = createSwitch(coordinateY: 430)
    private lazy var hamSwitch = createSwitch(coordinateY: 480)
    private lazy var mushroomsSwitch = createSwitch(coordinateY: 530)
    private lazy var oliveSwitch = createSwitch(coordinateY: 580)

    private lazy var infoButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.plain())
        button.tintColor = .orange
        button.setImage(UIImage(systemName: "i.circle"), for: .normal)
        button.addTarget(self, action: #selector(infoAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: 300, y: 350, width: 30, height: 30)
        return button
    }()

    var key: Int?
    var pizzas = ["Ветчина и сыр", "pizza1", "Маргарита", "pizza2"]
    var pizzaIngredients = PizzaIngredients()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        guard let inx = key else { return }
        pizzaLabel.text = pizzas[inx]
        pizzaLabel.frame = CGRect(x: view.center.x - 100, y: 30, width: 200, height: 30)
        pizzaImageView = UIImageView(image: UIImage(named: pizzas[inx + 1]))
        pizzaImageView.frame = CGRect(x: view.center.x - 150, y: 100, width: 300, height: 300)
        view.addSubview(pizzaLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(mozzarellaLabel)
        view.addSubview(hamLabel)
        view.addSubview(mushroomsLabel)
        view.addSubview(oliveLabel)
        view.addSubview(mozzarellaSwitch)
        view.addSubview(hamSwitch)
        view.addSubview(mushroomsSwitch)
        view.addSubview(oliveSwitch)
        view.addSubview(nextScreenButton)
        view.addSubview(infoButton)
    }

    private func createLabel(title: String, coordinateY: Int) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = label.font.withSize(23)
        label.frame = CGRect(x: 50, y: coordinateY, width: 200, height: 30)
        return label
    }

    private func createSwitch(coordinateY: Int) -> UISwitch {
        let swich = UISwitch(frame: CGRect(x: Int(view.bounds.width) - 100, y: coordinateY, width: 40, height: 30))
        return swich
    }

    private func checkSwitch() {
        pizzaIngredients.mozzarella = mozzarellaSwitch.isOn
        pizzaIngredients.ham = hamSwitch.isOn
        pizzaIngredients.mushrooms = mushroomsSwitch.isOn
        pizzaIngredients.olives = oliveSwitch.isOn
    }

// MARK: - Actions
    @objc private func nextScreenAction(_ sender: UIButton) {
        checkSwitch()
        let paymentVC = PaymentViewController()
        let newNC = UINavigationController(rootViewController: paymentVC)
        newNC.modalPresentationStyle = .fullScreen
        paymentVC.delegate = self
        paymentVC.pizzaIngredients = pizzaIngredients
        guard let pizza = pizzaLabel.text else { return }
        paymentVC.pizzaName = "Пицца \(pizza)"
        present(newNC, animated: true)
    }

    @objc private func infoAction(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .formSheet
        infoViewController.key = key
        present(infoViewController, animated: true)
    }
}

// MARK: - DelegateViewController
extension ChooseIngredientsViewController: DelegateViewController {

    func goToRootViewController() {
        self.dismiss(animated: true)
        if let navController = presentingViewController as? UINavigationController {
            navController.popToRootViewController(animated: true)
        }
    }
}
