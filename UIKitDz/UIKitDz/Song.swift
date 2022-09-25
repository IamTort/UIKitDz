//
//  Song.swift
//  UIKitDz
//
//  Created by angelina on 25.09.2022.
//

import Foundation
import UIKit
/// Model of Song
class Song {
    let name: String
    let singer: String
    let album: String
    let picture: String
    let song: String
    init(name: String, singer: String, album: String, picture: String, song: String) {
        self.name = name
        self.singer = singer
        self.album = album
        self.picture = picture
        self.song = song
    }
}
