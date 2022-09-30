//
//  ProfileViewController.swift
//  UIKitDz
//
//  Created by angelina on 25.09.2022.
//

import UIKit
/// Controller for add user
final class ProfileViewController: UIViewController {

    private let genderRows = ["мужчина", "женщина"]
    private let ageRows = Array(1...100)
    private lazy var toolBarPicker: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(toolbarDoneAction))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }()

    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        return picker
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        button.frame = CGRect(x: 10, y: 20, width: 100, height: 20)
        button.addTarget(self, action: #selector(cancelScreen(sender:)), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        button.frame = CGRect(x: UIScreen.main.bounds.width - 115, y: 20, width: 100, height: 20)
        button.clipsToBounds = true
        return button
    }()

    private lazy var avaImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.frame = CGRect(x: UIScreen.main.bounds.width / 4 + 20, y: 100, width: 150, height: 150)
        image.tintColor = .systemGray2
        image.clipsToBounds = true
        return image
    }()

    private lazy var changePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Изменить фото"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: 250, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.alpha = 0.5
        label.frame = CGRect(x: 20, y: 290, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldName: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите имя"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 20, y: 320, width: 300, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var lineOneView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 20, y: 350, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var dateTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.alpha = 0.5
        label.frame = CGRect(x: 20, y: 370, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldDate: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите дату"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 20, y: 400, width: 300, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.inputView = datePicker
        textfield.inputAccessoryView = toolBarPicker
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var lineTwoView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 20, y: 430, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.alpha = 0.5
        label.frame = CGRect(x: 20, y: 450, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldAge: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Добавить"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 20, y: 480, width: 300, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.clipsToBounds = true
        textfield.inputView = agePicker
        return textfield
    }()

    private lazy var lineThreeView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 20, y: 510, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.alpha = 0.5
        label.frame = CGRect(x: 20, y: 530, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldGender: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Добавить"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 20, y: 560, width: 300, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.inputView = genderPicker
        textfield.clipsToBounds = true
        return textfield
    }()

    private lazy var lineFourView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 20, y: 590, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private lazy var instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.alpha = 0.5
        label.frame = CGRect(x: 20, y: 610, width: 200, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.clipsToBounds = true
        return label
    }()

    private lazy var textfieldInstagram: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Добавить"
        textfield.textAlignment = .left
        textfield.frame = CGRect(x: 20, y: 640, width: 300, height: 20)
        textfield.font = UIFont(name: "Futura", size: 16)
        textfield.clipsToBounds = true
        textfield.addTarget(self, action: #selector(tappedAction(_:)), for: .allTouchEvents)
        return textfield
    }()

    private lazy var lineFiveView: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        line.frame = CGRect(x: 20, y: 670, width: UIScreen.main.bounds.width - 80, height: 1)
        line.clipsToBounds = true
        return line
    }()

    private var agePicker = UIPickerView()
    private var genderPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.dataSource = self
        agePicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.delegate = self
        agePicker.tag = 2
        genderPicker.tag = 3
        setupUI()
    }
}
// MARK: - setupUI
extension ProfileViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(avaImageView)
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(textfieldName)
        view.addSubview(lineOneView)
        view.addSubview(dateTimeLabel)
        view.addSubview(textfieldDate)
        view.addSubview(lineTwoView)
        view.addSubview(ageLabel)
        view.addSubview(textfieldAge)
        view.addSubview(lineThreeView)
        view.addSubview(genderLabel)
        view.addSubview(textfieldGender)
        view.addSubview(lineFourView)
        view.addSubview(instagramLabel)
        view.addSubview(textfieldInstagram)
        view.addSubview(lineFiveView)
    }
// MARK: - Action
    @objc func tappedAction(_ sender: Any) {
        let textfieldAlertController = UIAlertController(title: "Введите username Instagram", message: nil,
                                                         preferredStyle: .alert)
        textfieldAlertController.addTextField()
        let cancelAlertAction = UIAlertAction(title: "cancel", style: .default)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) { _ in
            guard let result = textfieldAlertController.textFields?.first?.text else { return }
            self.textfieldInstagram.text = "\(result)"
        }
        textfieldAlertController.addAction(cancelAlertAction)
        textfieldAlertController.addAction(okAlertAction)
        present(textfieldAlertController, animated: true)
    }

    @objc func toolbarDoneAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        textfieldDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    @objc func cancelScreen(sender: UIButton) {
        dismiss(animated: true)
    }
}
// MARK: - UIPickerViewDataSource
extension ProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 2:
            return ageRows.count
        case 3:
            return genderRows.count
        default:
            return 0
        }
    }
}
// MARK: - UIPickerViewDelegate
extension ProfileViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 2:
            textfieldAge.text = "\(ageRows[row])"
            return "\(ageRows[row])"
        case 3:
            textfieldGender.text = genderRows[row]
            return genderRows[row]
        default:
            return "0"
        }
    }
}
