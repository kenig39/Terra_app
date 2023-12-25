//
//  ViewModels.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//

import UIKit

class RegularLabelModel: UILabel {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.text = ""
      self.font = Constants.Fonts.SFProDisplay_Regular
      self.translatesAutoresizingMaskIntoConstraints = false
      self.textAlignment = .left
      self.numberOfLines = 0
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class MediumLabelModel: UILabel {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.text = ""
      self.translatesAutoresizingMaskIntoConstraints = false
      self.font = Constants.Fonts.SFProDisplay_Medium
      self.textAlignment = .left
      self.numberOfLines = 0
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class BlueLabelModel: UILabel {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.text = ""
      self.translatesAutoresizingMaskIntoConstraints = false
      self.font = Constants.Fonts.SFProDisplay_Regular
      self.textColor = Constants.Colors.blue
      self.textAlignment = .left
      self.numberOfLines = 0
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class GrayLabelModel: UILabel {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.text = ""
      self.translatesAutoresizingMaskIntoConstraints = false
      self.font = Constants.Fonts.SFProDisplay_Regular
      self.textColor = Constants.Colors.gray
      self.textAlignment = .left
      self.numberOfLines = 0
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class ButtonModel: UIButton {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.layer.cornerRadius = 5
      self.titleLabel?.font = Constants.Fonts.SFProDisplay_Regular
      self.titleLabel?.textAlignment = .center
      self.titleLabel?.textColor = .white
      self.applyShadow(cornerRadius: 5)
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class GrayButtonModel: UIButton {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.layer.cornerRadius = 10
      self.translatesAutoresizingMaskIntoConstraints = false
      self.titleLabel?.font = Constants.Fonts.LargeTitle
      self.titleLabel?.textAlignment = .center
      self.titleLabel?.textColor = Constants.Colors.gray
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
class CheckBoxButtonModel: UIButton {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.layer.cornerRadius = 13
      self.translatesAutoresizingMaskIntoConstraints = false
      self.setTitle("", for: .normal)
      self.titleLabel?.font = Constants.Fonts.SFProDisplay_Regular
      self.titleLabel?.textAlignment = .center
      self.titleLabel?.textColor = .white
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}


