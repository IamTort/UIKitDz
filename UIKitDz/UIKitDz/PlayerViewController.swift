//
//  PlayerViewController.swift
//  UIKitDz
//
//  Created by angelina on 24.09.2022.
//

import UIKit
import AVFoundation
// Controller of player
class PlayerViewController: UIViewController {
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var imagePic: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singer: UILabel!
    var player = AVAudioPlayer()
    var songs = [Song( name: "Nothing", singer: "DYMD", album: "Nothing",
                       picture: "album1", song: "dymd_nothing"),
                Song(name: "Гори гори", singer: "Монеточка", album:
                        "Гори", picture: "album2", song: "monetochka-gori")]
    var song: Int?
    var isPlaying: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        playing()
        player.play()
    }

    func playing() {
        do {
            if let audioPath = Bundle.main.path(forResource: songs[song ?? 0].song, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }

    func setupUI() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        guard let index = song else { return }
        albumLabel.text = songs[index].album
        imagePic.image = UIImage(named: songs[index].picture)
        songName.text = songs[index].name
        singer.text = songs[index].singer
    }

    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func playButtonAction(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }

    @IBAction func hideScreenAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
