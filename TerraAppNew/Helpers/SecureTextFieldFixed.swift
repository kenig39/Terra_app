//
//  TextFieldSecure.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 26.08.2022.
//

import UIKit

final class SecureTextFieldFixed: UITextField {
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let enteredText = text {
            text?.removeAll()
            insertText(enteredText)
        }
        return success
    }
}
