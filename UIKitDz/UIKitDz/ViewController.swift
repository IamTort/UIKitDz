//
//  ViewController.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit

/// ViewController NSLayoutConstraint
final class ViewController: UIViewController {
    
    // MARK: - Private Visual Components
    private let viewOne: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .cyan
        return view
    }()
    
    private let viewTwo: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .cyan
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(viewOne)
        view.addSubview(viewTwo)
        createViewConstraint()
        createViewTwoConstraint()
    }
    
    private func createViewConstraint() {
        NSLayoutConstraint(item: viewOne,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewOne,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewOne,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        NSLayoutConstraint(item: viewOne,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
    
    private func createViewTwoConstraint() {
        NSLayoutConstraint(item: viewTwo,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: viewOne,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewTwo,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewOne,
                           attribute: .top,
                           multiplier: 1,
                           constant: -8).isActive = true
        NSLayoutConstraint(item: viewTwo,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: viewTwo,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
}
