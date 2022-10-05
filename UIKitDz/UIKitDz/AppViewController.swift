//
//  AppViewController.swift
//  UIKitDz
//
//  Created by angelina on 04.10.2022.
//

import UIKit
/// Контроллер выбора кота
final class AppViewController: UIViewController {

    // MARK: - Private Visual Components
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var changeImageSwitch: UISwitch!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var colorPickerView: UIPickerView!

    // MARK: - Private properties
    private let colorsOfCat = ["черный", "белый", "бело-рыже-черный", "серый", "коричневый", "рыжий"]
    private var activityViewController: UIActivityViewController?
    private var chooseScin: String?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        logic()
    }

    // MARK: - Private methods
    private func setupUI() {
        catImageView.image = UIImage(named: "cat1")
    }

    private func logic() {
        sizeSlider.addTarget(self, action: #selector(changeTextSizeAction(_:)), for: .allEvents)
        changeImageSwitch.addTarget(self, action: #selector(changeImageAction(_:)), for: .touchUpInside)
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
    }

    // MARK: - Private Actions
    @objc private func changeTextSizeAction(_ sender: UISlider) {
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(sizeSlider.value * 1.0))
    }

    @objc private func changeImageAction(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            catImageView.image = UIImage(named: "cat1")
        case false:
            catImageView.image = UIImage(named: "cat2")
        }
    }

    @IBAction func shareAction(_ sender: Any) {
        guard let nameCat = nameTextfield.text,
              let skin = chooseScin,
              let gender = genderSegmentedControl.titleForSegment(at: genderSegmentedControl.selectedSegmentIndex)
        else {
            let alertVC = UIAlertController(title: "Назови кота!", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "ok", style: .default)
            alertVC.addAction(okAlertAction)
            present(alertVC, animated: true)
            return }
        activityViewController = UIActivityViewController(activityItems:
            ["Вы выбрали кота \(gender), c цветом шерсти: \(skin), и дали ему имя \(nameCat)", catImageView.image],
             applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
}

// MARK: - UIPickerViewDelegate
 extension AppViewController: UIPickerViewDelegate {
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return colorsOfCat[row]
     }
 }

 // MARK: - UIPickerViewDataSource
 extension AppViewController: UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return colorsOfCat.count
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         chooseScin = colorsOfCat[row]
     }
 }
