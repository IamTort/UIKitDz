//
//  NSLayoutAnchorViewController.swift
//  UIKitDz
//
//  Created by angelina on 16.10.2022.
//

import UIKit

///  Контроллер с констрейнтами с помощью NSLayoutAnchor
final class NSLayoutAnchorViewController: UIViewController {

    // MARK: - Private Visual Components
    private let blackView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        createViewRedConstraint()
        createViewYellowConstraint()
        createViewGreenConstraint()
        createViewBlackConstraint()
    }
    
    private func createViewRedConstraint() {
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createViewYellowConstraint() {
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10).isActive = true
        yellowView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1).isActive = true
        yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createViewGreenConstraint() {
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10).isActive = true
        greenView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
   
    private func createViewBlackConstraint() {
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -10).isActive = true
        blackView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10).isActive = true
    }
}
