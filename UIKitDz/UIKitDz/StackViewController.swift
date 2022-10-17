//
//  StackViewController.swift
//  UIKitDz
//
//  Created by angelina on 16.10.2022.
//

import UIKit

///  Контроллер с констрейнтами с потощью StackView
final class StackViewController: UIViewController {

    // MARK: - Private Visual Components
    private let blackStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .fill
        view.backgroundColor = .black
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        blackStackView.addArrangedSubview(redView)
        blackStackView.addArrangedSubview(yellowView)
        blackStackView.addArrangedSubview(greenView)
        view.addSubview(blackStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            blackStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            blackStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,
                                                   constant: -100),
            blackStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1/1)
        ])
    }
}
