//
//  ViewController.swift
//  TerraAppNew
//
//  Created by Tilek Koszhanov on 7/26/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LaunchScreen")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameView: UIImageView = {
        let nameView = UIImageView()
        nameView.image = UIImage(named: "largeImageLabel")
        return nameView
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10,
                                            y: 50,
                                            width: 340,
                                            height: 52))
        button.clipsToBounds = true
        button.setTitle("Вход", for: .normal)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor.specialBlue, for: .normal)
        button.titleLabel?.font = UIFont.proDisplayRegular22()
        button.layer.borderColor = UIColor.specialBlue.cgColor
        button.layer.borderWidth = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        enterButton.layer.cornerRadius = 5
        registerButton.applyShadow(cornerRadius: 5)
        registerButton.applyShadow(cornerRadius: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setupTargets()
        setupGradient()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(logoView)
        view.addSubview(enterButton)
        view.addSubview(registerButton)
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
        let colorFirst = #colorLiteral(red: 0.05032177321, green: 0.4962902694, blue: 0.725079139, alpha: 1).cgColor
        let colorSecond = #colorLiteral(red: 0.350124964, green: 0.8774992871, blue: 1, alpha: 1).cgColor
        
        gradient.colors = [colorFirst, colorSecond]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = enterButton.bounds
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.addSublayer(gradient)
        enterButton.titleLabel?.font = .proDisplay22()
    }
    
    // MARK: - Actions
    @objc func pressEnterButton() {
        let loginViewController = LoginViewController()
        navigationItem.backButtonTitle = "Вход"
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func pressRegisterButton() {
        let registerViewController = RegisterViewController()
        navigationItem.backButtonTitle = "Вход"
        navigationController?.pushViewController(registerViewController, animated: true)
    }
}

    //MARK: -  Targets
extension MainViewController {
    private func setupTargets() {
        enterButton.addTarget(self, action: #selector(pressEnterButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(pressRegisterButton), for: .touchUpInside)
    }
}

    //MARK: - SetConstraints
extension MainViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            enterButton.heightAnchor.constraint(equalToConstant: 52),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            enterButton.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 80),
            
            registerButton.heightAnchor.constraint(equalToConstant: 52),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            registerButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 22)
        ])
    }
}
