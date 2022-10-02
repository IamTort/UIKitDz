//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit

protocol InfoDelegate: AnyObject {
    func transmitInfo(model: String, image: UIImage, size: String, count: String, price: String)
}

/// Контроллер выбора кроссовок
class BootsViewController: UIViewController {

    // MARK: - Private property
    private lazy var segmentControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: menuArray)
        segmentedControl.sizeToFit()
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.frame = CGRect(x: 180, y: 500, width: 200, height: 30)
        segmentedControl.addTarget(self, action: #selector(selectedValueAction(target:)), for: .allEvents)
        return segmentedControl
    }()

    private lazy var bootsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "GazelleBlue"))
        imageView.frame = CGRect(x: 55, y: 100, width: 300, height: 300)
        return imageView
    }()

    private lazy var modelLabel = createLabel(title: "Gazzele Blue", coordinateY: 420)
    private lazy var colorLabel = createLabel(title: "Выбрать цвет:", coordinateY: 500)
    private lazy var sizeLabel = createLabel(title: "Выбрать размер:", coordinateY: 570)
    private lazy var countLabel = createLabel(title: "Выбрать количество:", coordinateY: 640)
    private lazy var priceLabel = createLabel(title: "Cтоимость:", coordinateY: 700)
    private lazy var priceFullLabel = createLabel(title: "Oбщая стоимость:", coordinateY: 750)
    private lazy var moneyLabel = createLabel(title: "8500 руб.", coordinateY: 750)
    private lazy var fullPriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.frame = CGRect(x: 170, y: 750, width: 200, height: 30)
        return label
    }()

    private lazy var nextScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 40, y: 800, width: 330, height: 50)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(nextScreenAction(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var textfieldSize: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "pазмер"
        textfield.textAlignment = .right
        textfield.frame = CGRect(x: 300, y: 570, width: 70, height: 30)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.inputView = sizePicker
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var textfieldCount: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "количество"
        textfield.textAlignment = .right
        textfield.frame = CGRect(x: 270, y: 640, width: 100, height: 30)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.clipsToBounds = true
        textfield.addTarget(self, action: #selector(changePriceAction(_:)), for: .allEvents)
        return textfield
    }()

    private var sizePicker = UIPickerView()

    private var menuArray = ["blue", "red", "purple"]
    private let imageArray = [UIImage(named: "GazelleBlue"),
                      UIImage(named: "GazelleRed"),
                      UIImage(named: "GazellePurple")]
    private let modelArray = ["Gazelle Blue", "Gazelle Red", "Gazelle Purple"]
    private let sizes = [36, 37, 38, 39, 40, 41, 42, 43]

    // MARK: - Public property
    var delegate: InfoDelegate?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        sizePicker.dataSource = self
        sizePicker.delegate = self
        view.addSubview(segmentControl)
        view.addSubview(bootsImageView)
        view.addSubview(modelLabel)
        modelLabel.textAlignment = .center
        modelLabel.frame = CGRect(x: 100, y: 420, width: 220, height: 30)
        modelLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(colorLabel)
        view.addSubview(sizeLabel)
        view.addSubview(countLabel)
        view.addSubview(priceLabel)
        view.addSubview(priceFullLabel)
        view.addSubview(textfieldSize)
        view.addSubview(textfieldCount)
        view.addSubview(nextScreenButton)
        moneyLabel.frame = CGRect(x: 270, y: 700, width: 100, height: 30)
        moneyLabel.textAlignment = .right
        view.addSubview(moneyLabel)
        view.addSubview(fullPriceLabel)
    }

    private func createLabel(title: String, coordinateY: Int) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 18)
        label.frame = CGRect(x: 30, y: coordinateY, width: 300, height: 30)
        return label
    }

    // MARK: - Private Actions
    @objc private func changePriceAction(_ sender: UITextField) {
        guard let text = textfieldCount.text else { return }
        guard let count = Int(text) else { return }
        fullPriceLabel.text = "\(8500 * count) рублей"
    }

    @objc private func selectedValueAction(target: UISegmentedControl) {
        guard target == segmentControl else { return }
        let segmentIndex = target.selectedSegmentIndex
        bootsImageView.image = imageArray[segmentIndex]
        modelLabel.text = modelArray[segmentIndex]
    }

    @objc private func nextScreenAction(_ sender: UIButton) {
        if fullPriceLabel.text == "" || textfieldSize.hasText == false {
            let alertC = UIAlertController(
                title: "Проверьте, что вы заполнили поля размера и количествa", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "ok", style: .default)
            alertC.addAction(okAlertAction)
            present(alertC, animated: true)
        } else {
            let paymentVC = PaymentViewController()
            delegate = paymentVC
            guard let model = modelLabel.text,
                  let image = bootsImageView.image,
                  let size = textfieldSize.text,
                  let count = textfieldCount.text,
                  let price = fullPriceLabel.text else { return }
            delegate?.transmitInfo(model: model, image: image, size: size, count: count, price: price)
            navigationController?.pushViewController(paymentVC, animated: false)
        }
    }
}

// MARK: - UIPickerViewDataSource
extension BootsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
}

// MARK: - UIPickerViewDelegate
extension BootsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        textfieldSize.text = String(sizes[row])
        return "\(sizes[row])"
    }
}
