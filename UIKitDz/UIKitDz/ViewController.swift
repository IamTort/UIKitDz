//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController for songs
class ViewController: UIViewController {
    @IBOutlet weak var firstSong: UIButton!
    @IBOutlet weak var songTwo: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func segueOne(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(
            identifier: "PlayerViewController") as? PlayerViewController else { return }
        secondViewController.song = 0
        show(secondViewController, sender: nil)
    }

    @IBAction func segueTwo(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(
            identifier: "PlayerViewController") as? PlayerViewController else { return }
        secondViewController.song = 1
        show(secondViewController, sender: nil)
    }
}
