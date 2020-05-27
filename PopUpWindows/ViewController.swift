//
//  ViewController.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 13.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import SwiftEntryKit

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
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        setupConstraints()
        
        
    }
    
    func setupAttributes() -> EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .init(light: UIColor(white: 100.0/255.0, alpha: 0.3), dark: UIColor(white: 50.0/255.0, alpha: 0.3)))
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 8
            )
        )
        
        attributes.entryBackground = .color(color: .standardBackground)
        attributes.roundCorners = .all(radius: 16)
        
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .jolt
        )
        
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.7,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            scale: .init(
                from: 1.05,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        
        attributes.exitAnimation = .init(
            translate: .init(duration: 0.2)
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.2)
            )
        )
        
        attributes.positionConstraints.verticalOffset = 10
        attributes.statusBar = .dark
        return attributes
    }
    
    @objc func handleShowPopUp() {
        SwiftEntryKit.display(entry: FullEmployeeAlertView(image: #imageLiteral(resourceName: "ic_done_all_dark_48pt"), fullName: "Александровсвкий\nСтанислав", specialty: "Сотрудник"), using: setupAttributes())
    }
    
    @objc func handleShowAlert() {
        SwiftEntryKit.display(entry: SmallAlertView(image: #imageLiteral(resourceName: "ic_done_all_dark_48pt"), fullName: "Александровский\nСтанислав", specialty: "Сотрудник"), using: setupAttributes())
        
        
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

