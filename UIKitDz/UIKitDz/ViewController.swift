//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController
final class ViewController: UIViewController {

    var myTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextField(param:)),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextField(param:)),
                                               name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    func createTextView() {
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 50,
                                              height: view.bounds.height / 2))
        myTextView.text = "Some text"
        myTextView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = .gray
        view.addSubview(myTextView)
    }

    @objc func updateTextField(param: Notification) {
        let userInfo = param.userInfo
        guard let getKeyboardRect = ((userInfo?[UIResponder.keyboardFrameEndUserInfoKey])
                                     as? NSValue)?.cgRectValue else { return }
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)

        if param.name == UIResponder.keyboardWillHideNotification {
            myTextView.contentInset = UIEdgeInsets.zero
        } else {
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height - 50, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.backgroundColor = .white
        myTextView.resignFirstResponder()
    }
}
