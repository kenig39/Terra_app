//
//  UIButton + Extension_GlebVersion.swift
//  TerraAppNew
//
//  Created by gleba on 01.08.2022.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(text: String = "") {
        self.init()
        self.init(type: .system)
        self.titleLabel?.text = text
        self.setTitle(text, for: .normal)
        self.backgroundColor = .specialGreen
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textAlignment = .center
        self.layer.cornerRadius = 5
        self.titleLabel?.font = .proDisplay14()
        self.isEnabled = true
    }
}
