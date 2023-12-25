//
//  EditTableViewCell.swift
//  TerraAppNew
//
//  Created by Natali on 27.07.2022.
//

import UIKit

class EditTableViewCell: UITableViewCell {

    private let backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let whatChangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Change something"
        label.font = .sfProDisplayBold18()
        return label

    }()

    private let lightSwitch: UISwitch = {
        let lightSwitch = UISwitch()
        lightSwitch.isOn = true
        lightSwitch.onTintColor = .green
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        return lightSwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none

        addSubview(backgroundCell)
        addSubview(lineView)
        addSubview(whatChangeLabel)
    }

    func setupCell(_ model: LabelTexts)  {
        whatChangeLabel.text = model.description
    }
}

//MARK: - set Constraints

extension EditTableViewCell {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])

        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor),
            lineView.topAnchor.constraint(equalTo: backgroundCell.topAnchor)
        ])

        NSLayoutConstraint.activate([
            whatChangeLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            whatChangeLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor)
        ])
    }
}

//MARK: - customize EditTableViewCell

extension EditTableViewCell {
    func addCustomDisclosureIndicator(with color: UIColor) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 15))
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .large)
        let symbolImage = UIImage(systemName: "chevron.right",
                                  withConfiguration: symbolConfig)
        button.setImage(symbolImage?.withTintColor(#colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.tintColor = color
        self.accessoryView = button
    }
}



