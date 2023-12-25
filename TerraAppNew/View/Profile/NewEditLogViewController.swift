//
//  NewEditLogViewController.swift
//  TerraAppNew
//
//  Created by Natali on 28.07.2022.
//

import UIKit

class NewEditLogViewController: UIViewController {

    private let changeLogLabel: UILabel = {
        let label = UILabel()
        label.text = "Изменить логин и пароль"
        label.textColor = .black
        label.font = .sfProDisplayBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let editLoginLabel = UILabel(text: "Логин", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let loginLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let oldPasswordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let newPasswordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let repeatNewPasswordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editLoginTextField: UITextField = {
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

    private let editOldPasswordLabel = UILabel(text: "Старый пароль", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editOldPasswordTextField: UITextField = {
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

    private let editNewPasswordLabel = UILabel(text: "Новый пароль", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editNewPasswordTextField: UITextField = {
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

    private let editRepeatNewPasswordLabel = UILabel(text: "Повторите пароль", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editRepeatNewPasswordTextField: UITextField = {
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

    private var editLoginStackView = UIStackView()
    private var editOldPasswordStackView = UIStackView()
    private var editNewPasswordStackView = UIStackView()
    private var editRepeatNewPasswordStackView = UIStackView()
    private var generalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
        setupViews()
        setConstraints()
}

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(changeLogLabel)

        editLoginStackView = UIStackView(arrangedSubviews: [editLoginLabel, editLoginTextField, loginLineView],
                                         axis: .vertical,
                                         spacing: 3)

        editOldPasswordStackView = UIStackView(arrangedSubviews: [editOldPasswordLabel, editOldPasswordTextField, oldPasswordLineView],
                                         axis: .vertical,
                                         spacing: 3)

        editNewPasswordStackView = UIStackView(arrangedSubviews: [editNewPasswordLabel, editNewPasswordTextField, newPasswordLineView],
                                         axis: .vertical,
                                         spacing: 3)

        editRepeatNewPasswordStackView = UIStackView(arrangedSubviews: [editRepeatNewPasswordLabel, editRepeatNewPasswordTextField, repeatNewPasswordLineView],
                                         axis: .vertical,
                                         spacing: 3)

        generalStackView = UIStackView(arrangedSubviews: [editLoginStackView,
                                                         editOldPasswordStackView,
                                                         editNewPasswordStackView,
                                                         editRepeatNewPasswordStackView
                                                         ],
                                       axis: .vertical,
                                       spacing: 20)

        view.addSubview(generalStackView)
    }

    @objc
    func rightHandAction() {
        print("right bar button action")
    }
}
// MARK: - set constraints

extension NewEditLogViewController {
    private func setConstraints() {

        NSLayoutConstraint.activate([
            changeLogLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 105),
            changeLogLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            changeLogLabel.heightAnchor.constraint(equalToConstant: 25)
        ])

        NSLayoutConstraint.activate([
            loginLineView.heightAnchor.constraint(equalToConstant: 1), oldPasswordLineView.heightAnchor.constraint(equalToConstant: 1), newPasswordLineView.heightAnchor.constraint(equalToConstant: 1), repeatNewPasswordLineView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            editLoginTextField.heightAnchor.constraint(equalToConstant: 40),
            editOldPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            editNewPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            editRepeatNewPasswordTextField.heightAnchor.constraint(equalToConstant: 40),

            generalStackView.topAnchor.constraint(equalTo: changeLogLabel.bottomAnchor, constant: 30),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
