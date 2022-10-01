//
//  PaymentViewController.swift
//  UIKitDz
//
//  Created by angelina on 29.09.2022.
//

import UIKit

/// Контроллер оплаты
final class PaymentViewController: UIViewController {

    // MARK: - Private properties
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.textAlignment = .left
        label.frame = CGRect(x: 40, y: 150, width: 200, height: 30)
        label.font = label.font.withSize(22)
        return label
    }()

    private lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        label.frame = CGRect(x: 40, y: 180, width: 300, height: 180)
        label.font = label.font.withSize(25)
        return label
    }()

    private lazy var payByCardLabel = createLabel(title: "Оплата картой", coordinateY: 600)
    private lazy var payByCashLabel = createLabel(title: "Наличными", coordinateY: 640)
    private lazy var cardSwitch = createSwitch(coordinateY: 600)
    private lazy var cashSwitch = createSwitch(coordinateY: 640)

    private lazy var payButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.tintColor = .orange
        button.setTitle("\u{F8FF} Pay", for: .normal)
        button.addTarget(self, action: #selector(payAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        return button
    }()

    private lazy var reviewButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.tintColor = .black
        button.setTitle("Оставить отзыв", for: .normal)
        button.addTarget(self, action: #selector(reviewAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 760, width: 300, height: 50)
        return button
    }()

    // MARK: - Public properties
    weak var delegate: PopToRootDelegate?
    var orderIngredients: [String] = []
    var pizzaIngredients: PizzaIngredients?
    var pizzaName = ""

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        navigationItem.title = "Оплата"
        pizzaLabel.text = "1 \(pizzaName)\n\(pizzaIngredients?.getPizzaIngredients() ?? "")"
        view.addSubview(orderLabel)
        view.addSubview(payByCardLabel)
        view.addSubview(payByCashLabel)
        view.addSubview(cardSwitch)
        view.addSubview(cashSwitch)
        view.addSubview(payButton)
        view.addSubview(pizzaLabel)
        view.addSubview(reviewButton)
        cardSwitch.isOn = true
        pizzaLabel.sizeToFit()
    }

    private func createLabel(title: String, coordinateY: Int) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = label.font.withSize(22)
        label.frame = CGRect(x: 50, y: coordinateY, width: 200, height: 30)
        return label
    }

    private func createSwitch(coordinateY: Int) -> UISwitch {
        let swich = UISwitch(frame: CGRect(x: Int(view.bounds.width) - 100, y: coordinateY, width: 40, height: 30))
        swich.addTarget(self, action: #selector(changeSwitchValueAction(_:)), for: .touchUpInside)
        return swich
    }

    // MARK: - Private Actions
    @objc private func changeSwitchValueAction(_ sender: UISwitch) {
        guard cashSwitch === sender else { cashSwitch.isOn.toggle()
            return }
        cardSwitch.isOn.toggle()
    }

    @objc private func payAction(_ sender: UIButton) {
        let buttonAlertController = UIAlertController(title: "Заказ оплачен!",
            message: "Ваш заказ доставят в течении 15 минут!\n Приятного аппетита", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) {_ in
            self.dismiss(animated: true)
            self.delegate?.goToRootViewController()
        }
        buttonAlertController.addAction(okAlertAction)
        present(buttonAlertController, animated: true)
    }

    @objc private func reviewAction(_ sender: UIButton) {
        let reviewAlertController = UIAlertController(title: "Привет!",
            message: "Нам будет очень приятно, если вы оставите отзыв\n и поможете нам стать лучше",
                                                      preferredStyle: .alert)
        reviewAlertController.addTextField()
        let okAlertAction = UIAlertAction(title: "ok", style: .default) { _ in
            guard (reviewAlertController.textFields?.first?.text) != nil else { return }
        }
        reviewAlertController.addAction(okAlertAction)
        present(reviewAlertController, animated: true)
    }
}
