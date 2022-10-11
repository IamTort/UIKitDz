//
//  UIFont + exstension.swift
//  UIKitDz
//
//  Created by angelina on 06.10.2022.
//

import UIKit

// MARK: - UIFont + exstension
 /// Pасширение шрифта
 extension UIFont {
     var bold: UIFont { return withWeight(.bold) }
     var semibold: UIFont { return withWeight(.semibold) }

     private func withWeight(_ weight: UIFont.Weight) -> UIFont {
         var attributes = fontDescriptor.fontAttributes
         var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

         traits[.weight] = weight

         attributes[.name] = nil
         attributes[.traits] = traits
         attributes[.family] = familyName

         let descriptor = UIFontDescriptor(fontAttributes: attributes)

         return UIFont(descriptor: descriptor, size: pointSize)
     }
 }
