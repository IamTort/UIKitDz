//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController with play
class ViewController: UIViewController {

    private lazy var begin: UIButton = {
        let button = UIButton()
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 40)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedAction(_:)), for: .touchUpInside)
        return button
    }()

    private var convertString = ConvertString()

    private lazy var reversedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Convert string"
        label.frame = CGRect(x: view.bounds.width / 4, y: 300, width: 210, height: 30)
        label.clipsToBounds = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(begin)
        view.addSubview(reversedLabel)
    }

    @objc func tappedAction(_ sender: UIButton) {
        let textfieldAlertController = UIAlertController(title: "Введите слово", message: nil,
                                                         preferredStyle: .alert)
        textfieldAlertController.addTextField()
        let cancelAlertAction = UIAlertAction(title: "cancel", style: .default)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) {_ in
            self.convertString.originalString = textfieldAlertController.textFields?.first?.text ?? ""
            self.reversedLabel.text = self.convertString.convertedString
            self.reversedLabel.center.x = self.view.center.x
        }
        textfieldAlertController.addAction(cancelAlertAction)
        textfieldAlertController.addAction(okAlertAction)
        self.present(textfieldAlertController, animated: true)
    }
}
