//
//  ViewController.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 13.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let popUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Show Pop Up View", for: .normal)
        button.setTitleColor(UIColor.systemIndigo, for: .normal)
        button.addTarget(self, action: #selector(handleShowPopUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Show Alert View", for: .normal)
        button.setTitleColor(UIColor.systemIndigo, for: .normal)
        button.addTarget(self, action: #selector(handleShowAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    @objc func handleShowPopUp() {
        print(#function)
    }
    
    @objc func handleShowAlert() {
        print(#function)
    }


}

// MARK: - Setup Constraints
extension ViewController {
    func setupConstraints() {
        view.addSubview(popUpButton)
        view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            popUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popUpButton.heightAnchor.constraint(equalToConstant: 50),
            popUpButton.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
        ])
        
        NSLayoutConstraint.activate([
            alertButton.topAnchor.constraint(equalTo: popUpButton.bottomAnchor, constant: 32),
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            alertButton.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
        ])
    }
}

