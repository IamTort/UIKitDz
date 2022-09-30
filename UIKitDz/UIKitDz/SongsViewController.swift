//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit
/// ViewController for songs
final class SongsViewController: UIViewController {
// MARK: - IBOutlet
    @IBOutlet weak var firstSongButton: UIButton!
    @IBOutlet weak var songTwoButton: UIButton!
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSongButton.tag = 0
        songTwoButton.tag = 1
    }
// MARK: - IBAction
    @IBAction func showPlayerVCAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(
            identifier: "PlayerViewController") as? PlayerViewController else { return }
        switch sender.tag {
        case 0:
            secondViewController.song = 0
        case 1:
            secondViewController.song = 1
        default:
            secondViewController.song = 0
        }
        show(secondViewController, sender: nil)
    }
}
