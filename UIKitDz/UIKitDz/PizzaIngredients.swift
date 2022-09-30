//
//  PizzaIngredients.swift
//  UIKitDz
//
//  Created by angelina on 29.09.2022.
//

import Foundation

/// Модель для хранения информации о выбранных ингридиентах пиццы
struct PizzaIngredients {
    var mozzarella = false
    var ham = false
    var mushrooms = false
    var olives = false

// MARK: - Public method
    func getPizzaIngredients() -> String {
        var number = 2
        var ingredients = ""
        if mozzarella {
            ingredients += "\(number) Mоцарелла\n"
            number += 1
        }
        if ham {
            ingredients += "\(number) Ветчина\n"
            number += 1
        }
        if mushrooms {
            ingredients += "\(number) Грибы\n"
            number += 1
        }
        if olives {
            ingredients += "\(number) Маслины\n"
            number += 1
        }
        return ingredients
    }
}
