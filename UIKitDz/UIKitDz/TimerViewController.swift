//
//  TimerViewController.swift
//  UIKitDz
//
//  Created by angelina on 01.10.2022.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
   
    @IBOutlet weak var timePickerView: UIPickerView!
    var hours = 1
    var minutes = 1
    var seconds = 1
    var hoursPickerData = [[Int]]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        startButton.layer.cornerRadius = 35
        

        timePickerView.delegate = self
        timePickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch component {
//        case 0:
//            hours = row
//        case 1:
//            minutes = row
//        case 2:
//            seconds = row
//        default:
//            break
//        }
//    }
}
