//
//  ConvertString.swift
//  UIKitDz
//
//  Created by angelina on 26.09.2022.
//

import Foundation
/// Model of label
struct ConvertString {
     var originalString = ""
     var convertedString: String {
         if originalString == "leohl" {
             return "hello"
         } else {
             return originalString
         }
     }
 }
