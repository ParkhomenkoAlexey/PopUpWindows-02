//
//  MyPopUpView.swift
//  Pods-PopUpWindows
//
//  Created by Алексей Пархоменко on 13.05.2020.
//

import UIKit

class MyPopUpView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
