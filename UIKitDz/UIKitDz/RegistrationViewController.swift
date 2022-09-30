//
//  RegistrationViewController.swift
//  UIKitDz
//
//  Created by angelina on 24.09.2022.
//

import UIKit
/// Контроллер регистрации гостей
final class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func checkAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let checkViewController = storyboard.instantiateViewController(
                             withIdentifier: "CheckViewController")
            self.navigationController?.pushViewController(checkViewController, animated: true)
        }
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(cancelAlertAction)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true)
    }
}
