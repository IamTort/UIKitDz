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
    private let oneView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .cyan
        return view
    }()
    
    private let twoView: UIView = {
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
        view.addSubview(oneView)
        view.addSubview(twoView)
        createViewConstraints()
        createViewTwoConstraint()
    }
    
    private func createViewConstraints() {
        NSLayoutConstraint(item: oneView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: oneView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: oneView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        NSLayoutConstraint(item: oneView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
    
    private func createViewTwoConstraint() {
        NSLayoutConstraint(item: twoView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: oneView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: twoView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: oneView,
                           attribute: .top,
                           multiplier: 1,
                           constant: -8).isActive = true
        NSLayoutConstraint(item: twoView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: twoView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
}
