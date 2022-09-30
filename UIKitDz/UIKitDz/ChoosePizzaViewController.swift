//
//  ChoosePizzaViewController.swift
//  UIKitDz
//
//  Created by angelina on 28.09.2022.
//

import UIKit
/// Контроллер выбора пиццы
final class ChoosePizzaViewController: UIViewController {

    // MARK: - Private properties
    private lazy var meetImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pizza1"))
        imageView.frame = CGRect(x: 30, y: 150, width: 150, height: 150)
        return imageView
    }()

    private lazy var vegPizzaImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pizza2"))
        imageView.frame = CGRect(x: 30, y: 320, width: 150, height: 150)
        return imageView
    }()

    private lazy var meetPizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветчина и сыр"
        label.font = label.font.withSize(22)
        label.frame = CGRect(x: 190, y: 210, width: 200, height: 30)
        return label
    }()

    private lazy var vegPizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Маргарита"
        label.font = label.font.withSize(22)
        label.frame = CGRect(x: 190, y: 380, width: 200, height: 30)
        return label
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.tintColor = .orange
        button.tag = 0
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(nextScreenAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: view.frame.width - 50, y: 210, width: 30, height: 30)
        return button
    }()

    private lazy var addTwoButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.tintColor = .orange
        button.tag = 2
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(nextScreenAction(_:)), for: .touchUpInside)
        button.frame = CGRect(x: view.frame.width - 50, y: 380, width: 30, height: 30)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public methods
    private func setupUI() {
        navigationItem.title = "Pizza"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:
                UIImage(systemName: "chevron.left"),
                style: .plain, target: self, action: #selector(backAction(_:)))
        view.addSubview(meetImageView)
        view.addSubview(vegPizzaImageView)
        view.addSubview(meetPizzaLabel)
        view.addSubview(vegPizzaLabel)
        view.addSubview(addButton)
        view.addSubview(addTwoButton)
    }

    // MARK: - Actions
    @objc private func nextScreenAction(_ sender: UIButton) {
        let ingredientsVC = ChooseIngredientsViewController()
        ingredientsVC.modalPresentationStyle = .formSheet
        ingredientsVC.key = sender.tag
        navigationController?.present(ingredientsVC, animated: true)
    }

    @objc private func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
