//
//  BirthdayViewController.swift
//  UIKitDz
//
//  Created by angelina on 25.09.2022.
//

import UIKit
/// Controller of users
class BirthdayViewController: UIViewController {

    private lazy var personImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 120, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var personTwoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 200, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var personThreeImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: 10, y: 280, width: 60, height: 60)
        image.tintColor = .systemGray3
        image.clipsToBounds = true
        return image
    }()

    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 190, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var lineTwoView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 270, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var lineThreeView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 10, y: 350, width: UIScreen.main.bounds.width - 20, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var jeremyLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 130, width: 200, height: 20)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var mariaLabel: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 190, width: 200, height: 60)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var jonyLabel: UILabel = {
        let label = UILabel()
        label.text = "Jony Stark"
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 270, width: 200, height: 60)
        label.font = UIFont(name: "Futura", size: 16)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooterLabel: UILabel = {
        let label = UILabel()
        label.text = "10 марта, в среду исполнится 25"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 150, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooterTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "30 марта, в четверг исполнится 20"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 230, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var timeFooterThreeLabel: UILabel = {
        let label = UILabel()
        label.text = "20 апреля, в субботу исполнится 25"
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.frame = CGRect(x: 75, y: 310, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 14)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "18 дней"
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.frame = CGRect(x: UIScreen.main.bounds.width - 110, y: 130, width: 90, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.frame = CGRect(x: UIScreen.main.bounds.width - 110, y: 210, width: 90, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var dateThreeLabel: UILabel = {
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
        configureNavigationController()
        setupUI()
    }

    func configureNavigationController() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationItem.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action:
                                                                #selector(rightButtonAction(sender:)))
    }

    func setupUI() {
        view.addSubview(personImageView)
        view.addSubview(personTwoImageView)
        view.addSubview(personThreeImageView)
        view.addSubview(lineView)
        view.addSubview(lineTwoView)
        view.addSubview(lineThreeView)
        view.addSubview(jeremyLabel)
        view.addSubview(mariaLabel)
        view.addSubview(jonyLabel)
        view.addSubview(timeFooterLabel)
        view.addSubview(timeFooterTwoLabel)
        view.addSubview(timeFooterThreeLabel)
        view.addSubview(dateLabel)
        view.addSubview(dateTwoLabel)
        view.addSubview(dateThreeLabel)
    }
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let profileVC = ProfileViewController()
        present(profileVC, animated: true)
    }
}
