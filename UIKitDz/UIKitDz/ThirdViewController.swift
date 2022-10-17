//
//  ThirdViewController.swift
//  UIKitDz
//
//  Created by angelina on 15.10.2022.
//

import UIKit

///  Controller NSLayoutAnchor
final class ThirdViewController: UIViewController {

    // MARK: - Private Visual Components
    private let redView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    private let greenView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    // MARK: - Private LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        
        createViewRedConstraints()
        createViewBlueConstraints()
        createViewGreenConstraints()
    }
    
    private func createViewRedConstraints() {
        redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func createViewBlueConstraints() {
        blueView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        blueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func createViewGreenConstraints() {
        greenView.rightAnchor.constraint(equalTo: blueView.rightAnchor).isActive = true
        greenView.leftAnchor.constraint(equalTo: redView.leftAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
