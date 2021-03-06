//
//  SmallAlertView.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SwiftEntryKit

class CollectionAlertView: UIView {
    
    let imageView = UIImageView()
    let fullNameLabel = UILabel()
    let specialtyLabel = UILabel()
    let actionButton = AlertButton(direction: .right, size: .small, type: .purple)
    let chooseDataLabel = UILabel()
    
    init(image: UIImage, fullName: String, specialty: String) {
        super.init(frame: UIScreen.main.bounds)
        fullNameLabel.text = fullName
        specialtyLabel.text = specialty
        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButtonPressed() {
        SwiftEntryKit.transform(to: FullEmployeeAlertView(image: #imageLiteral(resourceName: "ic_done_all_dark_48pt"), name: "Александровсвкий\nСтанислав", position: "Сотрудник"))
    }
}

// MARK: - Setup View
extension CollectionAlertView {
    func setupElements() {
        imageView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8549019608, alpha: 1)
        imageView.layer.cornerRadius = 8
        
        fullNameLabel.numberOfLines = 0
        specialtyLabel.numberOfLines = 0
        
        fullNameLabel.font = UIFont.init(name: "Helvetica", size: 15)
        fullNameLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 1)
        
        specialtyLabel.font = UIFont.init(name: "Helvetica", size: 15)
        specialtyLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 0.3049640487)
        
        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
    }
}

// MARK: - Setup Constraints
extension CollectionAlertView {
    func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(fullNameLabel)
        addSubview(specialtyLabel)
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            fullNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            specialtyLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 2),
            specialtyLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            specialtyLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2), // потому что тени
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 21).isActive = true
    }
}

