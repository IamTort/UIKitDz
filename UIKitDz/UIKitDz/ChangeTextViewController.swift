//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit

/// Контроллер для редактирования текста
final class ChangeTextViewController: UIViewController {
    // MARK: - Private enam
    private enum Constants {
        static let textForLabel = "Чтобы ввести текст, нажмите + и посмотрите, что произойдет"
        static let chooseSize = "Выбери размер текста:"
        static let colorText = "Выбери цвет текста:"
        static let countLines = "Выбери количество строк:"
        static let title = "Pедактор"
        static let alert = "Введите текст"
        static let okAlertButton = "ok"
    }

    // MARK: - Private properties
    private lazy var centerLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 100, width: 320, height: 160)
        label.text = Constants.textForLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .green
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 1, height: 2)
        label.backgroundColor = .lightGray
        return label
    }()

    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.chooseSize
        label.frame = CGRect(x: 50, y: 290, width: 320, height: 20)
        return label
    }()

    private lazy var sizeWordSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.25
        slider.frame = CGRect(x: 50, y: 330, width: 320, height: 5)
        slider.addTarget(self, action: #selector(changeTextSizeAction(_:)), for: .allEvents)
        return slider
    }()

    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.colorText
        label.frame = CGRect(x: 50, y: 360, width: 320, height: 20)
        return label
    }()

    private lazy var colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        picker.frame = CGRect(x: 50, y: 370, width: 320, height: 250)
        return picker
    }()

    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.countLines
        label.frame = CGRect(x: 50, y: 600, width: 320, height: 20)
        return label
    }()

    private lazy var linesCountPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        picker.frame = CGRect(x: 50, y: 600, width: 320, height: 200)
        return picker
    }()

    private var color = [("зеленый", UIColor.green), ("фиолетовый", UIColor.purple),
                 ("черный", UIColor.black), ("красный", UIColor.red),
                 ("желтый", UIColor.yellow), ("оранжевый", UIColor.orange), ("синий", UIColor.blue)]
    private var lines = [0, 1, 2]

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
        setupUI()
        delegateDatasourcePicker()
    }
    
    // MARK: - Private metods
    private func delegateDatasourcePicker() {
        colorPicker.dataSource = self
        colorPicker.delegate = self
        linesCountPicker.dataSource = self
        linesCountPicker.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(centerLabel)
        view.addSubview(sizeWordSlider)
        view.addSubview(colorPicker)
        view.addSubview(linesCountPicker)
        view.addSubview(colorLabel)
        view.addSubview(lineLabel)
        view.addSubview(sizeLabel)
    }

    private func setupBar() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                           action: #selector(addButtonAction(_:)))
        navigationItem.leftBarButtonItem = addBarButton
        navigationController?.navigationBar.backgroundColor = .systemGray6
        tabBarController?.tabBar.backgroundColor = .systemGray6
        navigationItem.title = Constants.title
        let tapBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        tabBarItem = tapBarItem

    }

    // MARK: - Private Actions
    @objc private func addButtonAction(_ sender: UIButton) {
        let alertVC = UIAlertController(title: Constants.alert, message: nil, preferredStyle: .alert)
        alertVC.addTextField()
        let okAlertAction = UIAlertAction(title: Constants.okAlertButton, style: .default) { _ in
            guard let result = alertVC.textFields?.first?.text else { return }
            self.centerLabel.text = result
        }
        alertVC.addAction(okAlertAction)
        present(alertVC, animated: true)
    }

    @objc private func changeTextSizeAction(_ sender: UISlider) {
        centerLabel.font = UIFont.systemFont(ofSize: CGFloat(sizeWordSlider.value * 100.0))
    }
}

// MARK: - UIPickerViewDelegate
extension ChangeTextViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return color[row].0
        case 1:
            return String(lines[row])
        default:
            return ""
        }
    }
}

// MARK: - UIPickerViewDataSource
extension ChangeTextViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return color.count
        case 1:
            return lines.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            centerLabel.textColor = color[row].1
        case 1:
            centerLabel.numberOfLines = lines[row]
        default:
            break
        }
    }
}
