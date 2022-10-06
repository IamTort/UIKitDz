//
//  TextViewController.swift
//  UIKitDz
//
//  Created by angelina on 06.10.2022.
//

import UIKit
/// Контроллер редактора текста
final class TextViewController: UIViewController {

    // MARK: - Private Enum
    private enum Constants {
        static let songText = """
        Вместо тепла — зелень стекла,
        Вместо огня — дым,
        Из сетки календаря выхвачен день.
        Красное солнце сгорает до тла,
        День догорает с ним,
        На пылающий город падает тень.

        Перемен! - требуют наши сердца.
        Перемен! - требуют наши глаза.
        В нашем смехе и в наших слезах,
        И в пульсации вен:
        Перемен!
        Мы ждем перемен!
        """
        static let smallChar = "textformat.size.smaller"
        static let largeChar = "textformat.size.larger"
        static let shareButton = "Paсшарить"
    }

    // MARK: - Private Visual Components
    private lazy var myTextView: UITextView = {
        var textView = UITextView()
        textView = UITextView(frame: CGRect(x: 20,
                                            y: 100,
                                            width: view.bounds.width - 40,
                                            height: view.bounds.height / 2))
        textView.text = Constants.songText
        textView.textColor = .black
        textView.backgroundColor = .systemGray6
        textView.isSelectable = false
        return textView
    }()

    private lazy var sizeSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 50, y: 600, width: view.bounds.width - 100, height: 30)
        slider.minimumValue = 10
        slider.value = 15
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(sizeSliderAction), for: .valueChanged)
        return slider
    }()

    private lazy var blueButton = createColorButton(tag: 0, coordinateX: 60)
    private lazy var greenButton = createColorButton(tag: 1, coordinateX: 140)
    private lazy var redButton = createColorButton(tag: 2, coordinateX: 220)
    private lazy var blackButton = createColorButton(tag: 3, coordinateX: 300)

    private lazy var smallFontButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: Constants.smallChar), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 330, y: 725, width: 15, height: 15)
        button.addTarget(self, action: #selector(smallFontAction), for: .touchUpInside)
        return button
    }()

    private lazy var largeFontButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: Constants.largeChar), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 350, y: 720, width: 20, height: 20)
        button.addTarget(self, action: #selector(largeFontAction), for: .touchUpInside)
        return button
    }()

    private lazy var modeLabel: UILabel = {
        let label = UILabel()
        label.text = "Light/Dark Mode"
        label.frame = CGRect(x: 40, y: 770, width: 150, height: 30)
        return label
    }()

    private lazy var darkLightSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.frame = CGRect(x: 320, y: 770, width: 30, height: 30)
        toggle.addTarget(self, action: #selector(darkThemeAction), for: .valueChanged)
        return toggle
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.shareButton, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 40, y: 710, width: 250, height: 40)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Private property
    private var myCurrentFont = ""
    private var colors = [UIColor.blue, UIColor.green, UIColor.red, UIColor.black]
    private var fonts = ["Futura", "Helvetica Neue", "Hoefler Text Italic", "Times New Roman"]
    private var fontsPicker = UIPickerView()
    var activityViewController: UIActivityViewController?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(myTextView)
        view.addSubview(sizeSlider)
        blueButton.addTarget(self, action: #selector(colorFontAction(_:)), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(colorFontAction(_:)), for: .touchUpInside)
        redButton.addTarget(self, action: #selector(colorFontAction(_:)), for: .touchUpInside)
        blackButton.addTarget(self, action: #selector(colorFontAction(_:)), for: .touchUpInside)
        view.addSubview(smallFontButton)
        view.addSubview(largeFontButton)
        fontsPicker.delegate = self
        fontsPicker.dataSource = self
        fontsPicker.frame = CGRect(x: 20, y: view.bounds.height - 100, width: view.bounds.width - 40, height: 100)
        view.addSubview(fontsPicker)
        view.addSubview(modeLabel)
        view.addSubview(darkLightSwitch)
        view.addSubview(shareButton)
    }

    private func createColorButton(tag: Int, coordinateX: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = colors[tag]
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: coordinateX, y: 650, width: 40, height: 40)
        button.tag = tag
        view.addSubview(button)
        return button
    }

    // MARK: - Private Actions
    @objc private func smallFontAction() {
        myTextView.font = UIFont(name: myCurrentFont, size: CGFloat(sizeSlider.value))
    }

    @objc private func largeFontAction() {
        myTextView.font = UIFont(name: myCurrentFont, size: CGFloat(sizeSlider.value))?.bold
    }

    @objc private func colorFontAction(_ sender: UIButton) {
        myTextView.textColor = colors[sender.tag]
    }

    @objc private func sizeSliderAction() {
        myTextView.font = UIFont.systemFont(ofSize: CGFloat(sizeSlider.value))
    }

    @objc private func darkThemeAction(_ toggle: UISwitch) {
        let currentTheme = toggle.isOn ? DarkOrLightMode.dark : DarkOrLightMode.light

        view.backgroundColor = currentTheme.backgroundColor
        myTextView.textColor = currentTheme.textColor
        myTextView.backgroundColor = currentTheme.backgroundColor
        modeLabel.textColor = currentTheme.textColor
        fontsPicker.tintColor = currentTheme.textColor
        fontsPicker.backgroundColor = currentTheme.backgroundColor
        smallFontButton.tintColor = currentTheme.textColor
        largeFontButton.tintColor = currentTheme.textColor
    }

    @objc private func shareAction(_ sender: Any) {
        activityViewController = UIActivityViewController(activityItems:
                                                            [myTextView.text ?? ""],
                                                          applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
}

// MARK: - Exstension UIPickerViewDelegate, UIPickerViewDataSource
extension TextViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fonts.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fonts[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myTextView.font = UIFont(name: fonts[row], size: CGFloat(sizeSlider.value))
        myTextView.resignFirstResponder()
        myCurrentFont = fonts[row]
    }
}
