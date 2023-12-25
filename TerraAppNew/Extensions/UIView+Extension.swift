//
//  UIView+Extension.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 27.07.2022.
//

import UIKit

extension UIView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
