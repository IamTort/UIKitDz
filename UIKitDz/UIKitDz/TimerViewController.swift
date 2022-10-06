//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// Контроллер таймера
class TimerViewController: UIViewController {

    // MARK: - Constants
    enum Constants {
        static let pause = "Пауза"
        static let start = "Старт"
        static let startLabel = "0 секунд"
        static let seconds = "секунд"
    }
    // MARK: - Private IBOutlets
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!

    // MARK: - Private property
    private var timer: Timer?
    private var seconds = 0
    private var activeTimer = false

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private method
    private func setup() {
        startButton.layer.cornerRadius = 33
        resetButton.layer.cornerRadius = 33
    }

    // MARK: - Private Action
    @objc private func timeUpdateAction() {
        seconds += 1
        timerLabel.text = String("\(seconds) \(Constants.seconds)")
    }

    // MARK: - Private IBActions
    @IBAction private func startButtonAction(_ sender: Any) {
        if !activeTimer {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                         selector: #selector(timeUpdateAction), userInfo: nil, repeats: true)
            activeTimer = true
            startButton.setTitle(Constants.pause, for: .normal)
            startButton.backgroundColor = .systemOrange
        } else {
            timer?.invalidate()
            activeTimer = false
            startButton.setTitle(Constants.start, for: .normal)
            startButton.backgroundColor = #colorLiteral(red: 0.294585238, green: 0.4787010117, blue: 0.1104694642, alpha: 1)
        }
    }

    @IBAction private func stopButtonAction(_ sender: Any) {
        if activeTimer {
            startButton.setTitle(Constants.start, for: .normal)
            startButton.backgroundColor = #colorLiteral(red: 0.294585238, green: 0.4787010117, blue: 0.1104694642, alpha: 1)
        }
        seconds = 0
        activeTimer = false
        timer?.invalidate()
        timerLabel.text = Constants.startLabel
    }
}
