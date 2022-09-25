//
//  BirthdayViewController.swift
//  UIKitDz
//
//  Created by angelina on 25.09.2022.
//

import UIKit
/// Controller of users
class BirthdayViewController: UIViewController {

    private lazy var image: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 120, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var imageTwo: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 200, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var imageThree: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 280, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 190, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var lineTwo: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 270, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var lineThree: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 350, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var jeremy: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 130, width: 200, height: 20)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var maria: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 190, width: 200, height: 60)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var jony: UILabel = {
        let label = UILabel()
        label.text = "Jony Stark"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 270, width: 200, height: 60)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooter: UILabel = {
        let label = UILabel()
        label.text = "10 марта, в среду исполнится 25"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 150, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooterTwo: UILabel = {
        let label = UILabel()
        label.text = "30 марта, в четверг исполнится 20"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 230, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooterThree: UILabel = {
        let label = UILabel()
        label.text = "20 апреля, в субботу исполнится 25"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 310, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateLabl: UILabel = {
        let label = UILabel()
        label.text = "18 дней"
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.frame = CGRect(x: UIScreen.main.bounds.width - 110, y: 130, width: 90, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateLablTwo: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.frame = CGRect(x: UIScreen.main.bounds.width - 110, y: 210, width: 90, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateLablThree: UILabel = {
        let label = UILabel()
        label.text = "53 дня"
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.frame = CGRect(x: UIScreen.main.bounds.width - 110, y: 290, width: 90, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationItem.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action:
                                                                #selector(rightButtonAction(sender:)))
        view.addSubview(image)
        view.addSubview(imageTwo)
        view.addSubview(imageThree)
        view.addSubview(line)
        view.addSubview(lineTwo)
        view.addSubview(lineThree)
        view.addSubview(jeremy)
        view.addSubview(maria)
        view.addSubview(jony)
        view.addSubview(timeFooter)
        view.addSubview(timeFooterTwo)
        view.addSubview(timeFooterThree)
        view.addSubview(dateLabl)
        view.addSubview(dateLablTwo)
        view.addSubview(dateLablThree)
    }
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let profileVC = ProfileViewController()
        present(profileVC, animated: true)
    }
}
