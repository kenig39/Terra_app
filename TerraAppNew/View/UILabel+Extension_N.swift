//
//  UILabel+Extension.swift
//  TerraAppNew
//
//  Created by Natali on 28.07.2022.
//

import UIKit

extension UILabel {

    convenience init(text: String = "", font: UIFont?, textColor: UIColor, line: Int) {
        self.init()
        
        self.numberOfLines = line
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
}
    convenience init(text: String = "", font: UIFont?, color: UIColor, line: Int) {
          self.init()
          
          self.numberOfLines = line
          self.text = text
          self.font = font
          self.textColor = color
          self.textAlignment = .left
          self.translatesAutoresizingMaskIntoConstraints = false
      }

    convenience init(text: String = "", font: UIFont? , textColor: UIColor ) {
        self.init()

        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func addImage(imageName: String, afterLabel bolAfterLabel: Bool = false)
        {
            let attachment: NSTextAttachment = NSTextAttachment()
            attachment.image = UIImage(named: imageName)
            let attachmentString: NSAttributedString = NSAttributedString(attachment: attachment)

            if (bolAfterLabel)
            {
                let strLabelText: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
                strLabelText.append(attachmentString)

                self.attributedText = strLabelText
            }
            else
            {
                let strLabelText: NSAttributedString = NSAttributedString(string: self.text!)
                let mutableAttachmentString: NSMutableAttributedString = NSMutableAttributedString(attributedString: attachmentString)
                mutableAttachmentString.append(strLabelText)

                self.attributedText = mutableAttachmentString
            }
        }
}
