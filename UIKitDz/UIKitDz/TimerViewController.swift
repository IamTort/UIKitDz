//
//  TimerViewController.swift
//  UIKitDz
//
//  Created by angelina on 01.10.2022.
//

import UIKit
/// Контроллер таймера
class TimerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var timePickerView: UIPickerView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerView.delegate = self
        timePickerView.dataSource = self
    }
}

// MARK: -  UIPickerViewDelegate + extension
extension TimerViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1, 2:
            return 60
        default:
            return 0
        }
    }
}

// MARK: -  UIPickerViewDataSource + extension
extension TimerViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}
