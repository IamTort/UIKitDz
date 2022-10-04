//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// Контроллер с примерами кнопки поделиться
final class ExampleViewController: UIViewController {

    enum Components {
        static let plusPic = "plus"
        static let enterText = "Enter you text to share"
        static let shareButton = "Расшарить"
        static let minusPic = "minus"
        static let alert = "Cначала введите текст, потом нажмите кнопку"
        static let okButton = "ok"
        static let link = "https://github.com/tutu-ru/swift-style-guide"
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var wheelPickerView: UIPickerView!
    @IBOutlet private weak var picImageView: UIImageView!
    @IBOutlet private weak var chooseSegmetedControl: UISegmentedControl!

    // MARK: - Public properties
    private var buttonShare = UIButton()
    private var textField = UITextField()
    private var activityViewController: UIActivityViewController?
    private var numbers = [0, 1, 2, 3, 4]

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        createTextField()
        createButton()
        wheelPickerView.dataSource = self
        wheelPickerView.delegate = self
        chooseSegmetedControl.selectedSegmentIndex = 0
        picImageView.image = UIImage(systemName: Components.plusPic)
    }

    private func createTextField() {
        textField.frame = CGRect(x: 0, y: 100, width: 200, height: 30)
        textField.center.x = view.center.x
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.placeholder = Components.enterText
        view.addSubview(textField)
    }

    private func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.center.x = view.center.x
        buttonShare.frame = CGRect(x: 60, y: 150, width: 280, height: 44)
        buttonShare.setTitle(Components.shareButton, for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShareAction(paramSender:)), for: .touchUpInside)
        view.addSubview(buttonShare)
    }

    @objc private func handleShareAction(paramSender: Any) {
        let text = textField.text
        // MARK: - Private properties
        if text?.count == 0 {
            let message = Components.alert
            let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: Components.okButton, style: .cancel)
            alertViewController.addAction(okAction)
            present(alertViewController, animated: true)
        }
        activityViewController = UIActivityViewController(activityItems:
                                                            [textField.text ?? "nil"], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }

    // MARK: - Private IBActions
    @IBAction private func choosePictureAction(_ sender: UISegmentedControl) {
        switch chooseSegmetedControl.selectedSegmentIndex {
        case 0:
            picImageView.image = UIImage(systemName: Components.plusPic)
        case 1:
            picImageView.image = UIImage(systemName: Components.minusPic)
        default:
            break
        }
    }

    @IBAction private func shareLinkAction(_ sender: Any) {
        activityViewController = UIActivityViewController(activityItems:
                                                            [Components.link], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }

    @IBAction private func shareDateAction(_ sender: Any) {
        guard let image = picImageView.image,
              let text = textField.text else { return }
        activityViewController = UIActivityViewController(activityItems:
                                                            [image, text], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
}

// MARK: - UITextFieldDelegate + extension
extension ExampleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UIPickerViewDelegate + extension
extension ExampleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}

// MARK: - UIPickerViewDataSource + extension
extension ExampleViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numbers.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 3:
            activityViewController = UIActivityViewController(activityItems:
                                        ["\(row)"], applicationActivities: nil)
            present(activityViewController!, animated: true)
        default:
            break
        }
    }
}
