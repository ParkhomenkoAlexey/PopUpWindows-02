//
//  FullEmployeeAlertView.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SwiftEntryKit


class FullEmployeeAlertView: UIView {
    
    let imageView = UIImageView()
    let fullNameLabel = UILabel()
    let specialtyLabel = UILabel()
    let descriptionLabel = UILabel()
    let actionButton = AlertButton(title: "Выбрать дату визита", direction: .left, size: .large, type: .clear)
    
    init(image: UIImage?, fullName: String, specialty: String) {
        super.init(frame: UIScreen.main.bounds)
//        imageView.image = image
        fullNameLabel.text = fullName
        specialtyLabel.text = specialty
        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionButtonPressed() {
        
    }
}

// MARK: - Setup View
extension FullEmployeeAlertView {
    func setupElements() {
        imageView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8549019608, alpha: 1)
        imageView.layer.cornerRadius = 8
        
        descriptionLabel.text = "The state of Utah in the United States is home to lots of beautiful Park The state of Utah in the United States is home to lots of beautiful Parks The state of Utah in the United States is home to lots of  home to lots of beautiful Park The state of Utah in the United States is home to lots of beautiful Parks The state of Utah in the United States is home to lots of "
        
        fullNameLabel.textAlignment = .center
        
        fullNameLabel.numberOfLines = 2
        specialtyLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 5
        
        fullNameLabel.font = UIFont.init(name: "Helvetica-Bold", size: 20)
        fullNameLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 1)
        
        specialtyLabel.font = UIFont.init(name: "Helvetica", size: 15)
        specialtyLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 0.3049640487)
        
        descriptionLabel.font = UIFont.init(name: "Helvetica", size: 16)
        descriptionLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 0.5)
        
        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
    }
}

// MARK: - Setup Constraints
extension FullEmployeeAlertView {
    func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(fullNameLabel)
        addSubview(specialtyLabel)
        addSubview(descriptionLabel)
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 96),
            imageView.heightAnchor.constraint(equalToConstant: 96)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            specialtyLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            specialtyLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            specialtyLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 34).isActive = true
    }
}


