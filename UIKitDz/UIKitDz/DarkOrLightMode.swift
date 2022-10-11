//
//  DarkOrLightMode.swift
//  UIKitDz
//
//  Created by angelina on 06.10.2022.
//

import UIKit
 // MARK: - Structure

 /// Структура для светлой или темной темы
 struct DarkOrLightMode {
     let textColor: UIColor
     let backgroundColor: UIColor

     static let light = DarkOrLightMode(textColor: .black, backgroundColor: .white)
     static let dark = DarkOrLightMode(textColor: .white, backgroundColor: .black)
 }
