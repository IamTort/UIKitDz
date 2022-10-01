//
//  InfoViewController.swift
//  UIKitDz
//
//  Created by angelina on 30.09.2022.
//

import UIKit

/// Контроллер информации о пицце
final class InfoViewController: UIViewController {

    // MARK: - Private properties
    private lazy var descriptionLabel = createLabel(title: "Состав пиццы: ", coordinateY: 100)
    private lazy var pizzaLabel = createLabel(title: "cjcnfd", coordinateY: 160)
    private lazy var weightLabel = createLabel(title: "Масса:", coordinateY: 260)
    private lazy var massaLabel = createLabel(title: "cjcnfd", coordinateY: 320)

    // MARK: - Public properties
    var key: Int?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        setStringInLabel()
        view.addSubview(descriptionLabel)
        view.addSubview(pizzaLabel)
        view.addSubview(weightLabel)
        view.addSubview(massaLabel)
        descriptionLabel.sizeToFit()
        pizzaLabel.sizeToFit()
    }

    private func createLabel(title: String, coordinateY: Int) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = label.font.withSize(22)
        label.frame = CGRect(x: 30, y: coordinateY, width: 340, height: 150)
        label.numberOfLines = 0
        return label
    }

    private func setStringInLabel() {
        switch key {
        case 0:
            pizzaLabel.text = "Увеличенная порция моцареллы, томаты, итальянские травы, фирменный томатный соус"
            massaLabel.text = "450 грамм"
        case 2:
            pizzaLabel.text =
            "Пастрами из индейки, острая чоризо, пикантная пепперони, бекон, моцарелла, фирменный томатный соус"
            massaLabel.text = "560 грамм"
        case .none:
            pizzaLabel.text = "Cостав неизвестен"
            massaLabel.text = "не менее 560 грамм"
        case (_):
            pizzaLabel.text = "Cостав неизвестен"
            massaLabel.text = "не меннее 560 грамм"
        }
    }
}
