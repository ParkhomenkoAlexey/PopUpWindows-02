//
//  BalanceSendAlertView.swift
//  PopUpWindows
//
//  Created by Pavel Moroz on 26.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SwiftEntryKit

class PresentStartAlert: UIView {

    private let imageView = UIImageView()
    private let specialtyLabel = UILabel()
    private let actionButton = AlertButton(title: "Отправить", direction: .right, size: .large, type: .purple)
    private var userName = String()

    init(image: UIImage, userName: String) {
        super.init(frame: UIScreen.main.bounds)
        self.imageView.image = image
        self.userName = userName

        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButtonPressed() {
        SwiftEntryKit.transform(to: PresentFinishAlert(image: #imageLiteral(resourceName: "present"), userName: "Павел", presentNameLabel: "Название подарка"))
    }
}

// MARK: - Setup View
extension PresentStartAlert {
    func setupElements() {
        //imageView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8549019608, alpha: 1)
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 8

        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Helvetica-Bold", size: 20)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20)]
        let attributedString1 = NSMutableAttributedString(string:"\(userName),\n", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:"Для Вас мы подготовили персональтный подарок", attributes:attrs2 as [NSAttributedString.Key : Any])

        attributedString1.append(attributedString2)
        specialtyLabel.attributedText = attributedString1
        specialtyLabel.numberOfLines = 0
        specialtyLabel.textAlignment = .center
//        specialtyLabel.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        specialtyLabel.font = UIFont.init(name: "Helvetica", size: 20)

        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)

    }
}


// MARK: - Setup Constraints
extension PresentStartAlert {
    func setupConstraints() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(specialtyLabel)
        addSubview(actionButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            imageView.heightAnchor.constraint(equalToConstant: 83),
            imageView.widthAnchor.constraint(equalToConstant: 88),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            specialtyLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 34),
            specialtyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            specialtyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),

        ])

        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 34),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])


        bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 34).isActive = true
    }
}
