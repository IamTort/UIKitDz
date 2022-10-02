//
//  PaymentViewController.swift
//  UIKitDz
//
//  Created by angelina on 03.10.2022.
//

import UIKit
/// Контролер оплаты
class PaymentViewController: UIViewController {

    // MARK: - Private property
    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.frame = CGRect(x: 30, y: 90, width: 200, height: 40)
        return label
    }()

    private lazy var bootsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "GazelleBlue"))
        imageView.frame = CGRect(x: 30, y: 150, width: 100, height: 100)
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gazzele"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        label.frame = CGRect(x: 150, y: 160, width: 300, height: 30)
        return label
    }()

    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Размер:"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        label.frame = CGRect(x: 150, y: 190, width: 150, height: 30)
        return label
    }()

    private lazy var sizeGetLabel: UILabel = {
        let label = UILabel()
        label.text = "34"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        label.frame = CGRect(x: 220, y: 190, width: 150, height: 30)
        return label
    }()

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество:"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        label.frame = CGRect(x: 150, y: 215, width: 150, height: 30)
        return label
    }()

    private lazy var countGetLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        label.frame = CGRect(x: 255, y: 215, width: 150, height: 30)
        return label
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 40, y: 800, width: 330, height: 50)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Cтоимость:"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 27)
        label.frame = CGRect(x: 30, y: 750, width: 200, height: 40)
        return label
    }()

    private lazy var priceRightLabel: UILabel = {
        let label = UILabel()
        label.text = "\(3 * 8500) рублей"
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 27)
        label.frame = CGRect(x: 190, y: 750, width: 200, height: 40)
        return label
    }()

    // MARK: - Public property
    var activityViewController: UIActivityViewController?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(pageLabel)
        view.addSubview(bootsImageView)
        view.addSubview(nameLabel)
        view.addSubview(sizeLabel)
        view.addSubview(sizeGetLabel)
        view.addSubview(countLabel)
        view.addSubview(countGetLabel)
        view.addSubview(shareButton)
        view.addSubview(priceLabel)
        view.addSubview(priceRightLabel)
    }

    // MARK: - Private Actions
    @objc private func shareAction(_ sender: Any) {
        guard let model = nameLabel.text,
              let count = countGetLabel.text,
              let size = sizeGetLabel.text else { return }
        activityViewController = UIActivityViewController(activityItems:
                    ["Заказаны кроссовки модели \(model), количество: \(count) шт., \(size) размера"],
                    applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
}

// MARK: - InfoDelegate + extension
extension PaymentViewController: InfoDelegate {
    func transmitInfo(model: String, image: UIImage, size: String, count: String, price: String) {
        nameLabel.text = model
        bootsImageView.image = image
        sizeGetLabel.text = size
        countGetLabel.text = count
        priceRightLabel.text = price
    }
}
