//
//  MyCompaniesView.swift
//  TerraAppNew
//
//  Created by Natali on 28.07.2022.
//

import UIKit

class MyCompaniesView: UIView {

    private let companyNameLabel = UILabel(text: "Название", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let companyNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let companyNameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let companyTypeLabel = UILabel(text: "Тип компании", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let companyTypeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let companyTypeLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var companyNameStackView = UIStackView()
    private var companyTypeStackView = UIStackView()
    private var generalCompanyStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = 5

        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        companyNameStackView = UIStackView(arrangedSubviews: [companyNameLabel, companyNameTextField, companyNameLineView],
                                           axis: .vertical,
                                           spacing: 5)

        companyTypeStackView = UIStackView(arrangedSubviews: [companyTypeLabel, companyTypeTextField, companyTypeLineView],
                                           axis: .vertical,
                                           spacing: 2)

        generalCompanyStackView = UIStackView(arrangedSubviews: [companyNameStackView,
                                                                 companyTypeStackView
                                                                ],
                                              axis: .vertical,
                                              spacing: 15)

        self.addSubview(generalCompanyStackView)
    }
}
//MARK: - set Constraints
extension MyCompaniesView {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            companyNameTextField.heightAnchor.constraint(equalToConstant: 35),
            companyTypeTextField.heightAnchor.constraint(equalToConstant: 35),

            generalCompanyStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            generalCompanyStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            generalCompanyStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            companyNameLineView.heightAnchor.constraint(equalToConstant: 1),
            companyTypeLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}




