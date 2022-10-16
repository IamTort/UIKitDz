//
//  NSLayoutConstraintViewController.swift
//  UIKitDz
//
//  Created by angelina on 16.10.2022.
//

import UIKit

///  Контроллер с констрейнтами с помощью NSLayoutConstraint
final class NSLayoutConstraintViewController: UIViewController {
    
    // MARK: - Private Visual Components
    private let blackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .black
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .systemGreen
        return view
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        
        createBlackViewConstraint()
        createRedViewConstraint()
        createYellowViewConstraint()
        createGreenViewConstraint()
    }
    
    private func createBlackViewConstraint() {
        NSLayoutConstraint(
            item: blackView,
            attribute: .top,
            relatedBy: .equal,
            toItem: redView,
            attribute: .top,
            multiplier: 1,
            constant: -10).isActive = true
        
        NSLayoutConstraint(
            item: blackView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .leading,
            multiplier: 1,
            constant: -10).isActive = true
        
        NSLayoutConstraint(
            item: blackView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .trailing,
            multiplier: 1,
            constant: 10).isActive = true
        
        NSLayoutConstraint(
            item: blackView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
    }
    
    private func createRedViewConstraint() {
        NSLayoutConstraint(
            item: redView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .topMargin,
            multiplier: 1,
            constant: 100).isActive = true
        
        NSLayoutConstraint(
            item: redView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: redView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .height,
            multiplier: 1,
            constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: redView,
            attribute: .height,
            relatedBy: .equal,
            toItem: redView,
            attribute: .width,
            multiplier: 1 / 1,
            constant: 0).isActive = true
    }
    
    private func createYellowViewConstraint() {
        NSLayoutConstraint(
            item: yellowView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: yellowView,
            attribute: .top,
            relatedBy: .equal,
            toItem: redView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
        
        NSLayoutConstraint(
            item: yellowView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .top,
            multiplier: 1,
            constant: -10).isActive = true
        
        NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .height,
            multiplier: 1,
            constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .width,
            multiplier: 1 / 1,
            constant: 0).isActive = true
    }
    
    private func createGreenViewConstraint() {
        NSLayoutConstraint(
            item: greenView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true

        NSLayoutConstraint(
            item: greenView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottomMargin,
            multiplier: 1,
            constant: -100).isActive = true
       
        NSLayoutConstraint(
            item: greenView,
            attribute: .width,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .height,
            multiplier: 1 / 1,
            constant: 0).isActive = true
    }
}
