//
//  SmallAlertView.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SwiftEntryKit

class SmallBuyAlertView: UIView {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let actionButton = AlertButton(direction: .right, size: .small, type: .purple)

    init(image: UIImage, name: String, price: Int) {
        super.init(frame: UIScreen.main.bounds)
        //        imageView.image = image
        self.imageView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8549019608, alpha: 1)
        self.titleLabel.text = name
        self.priceLabel.text = "\(price) руб."
        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButtonPressed() {

        let newView = NameBuyAlertView(image: #imageLiteral(resourceName: "ic_done_all_dark_48pt"), title: "Наименование товара или услуги", specialtyLabel: "Knit crewneck sweater from YMC. Crewneck collar. Raglan sleeves. Ribbed trim. Straight hem.", price: 1500)
//        SwiftEntryKit.transform(to: newView)
        transform(to: newView)

    }
}

// MARK: - Setup View
extension SmallBuyAlertView {
    func setupElements() {
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 8

        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.init(name: "Helvetica", size: 15)
        titleLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 1)

        priceLabel.font = UIFont.init(name: "Helvetica", size: 15)
        priceLabel.textColor = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 0.3049640487)
        priceLabel.numberOfLines = 0
        priceLabel.textColor = UIColor(#colorLiteral(red: 0.2549019608, green: 0.03921568627, blue: 0.9137254902, alpha: 1))

        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)

        

    }
}

// MARK: - Setup Constraints
extension SmallBuyAlertView {
    func setupConstraints() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(actionButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -30),
            priceLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
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

