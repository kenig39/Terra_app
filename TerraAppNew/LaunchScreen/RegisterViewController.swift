//
//  RegisterViewController.swift
//  TerraAppNew
//
//  Created by Tilek Koszhanov on 7/27/22.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    private var regType: RegType = .email
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Заполните данные"
        label.font = UIFont.sfProDisplayBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Имя пользователя"
        label.font = UIFont.proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userNameTextField:UITextField = {
        let textField = UITextField()
        textField.font = UIFont.proDisplay18()
        textField.placeholder = "Введите имя пользователя"
        textField.textContentType = .oneTimeCode
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginLabel:UILabel = {
        let label = UILabel()
        label.text = "Логин пользователя"
        label.font = UIFont.proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTextField:UITextField = {
        let textField = UITextField()
        textField.font = UIFont.proDisplay18()
        textField.placeholder = "Введите логин пользователя"
        textField.textContentType = .oneTimeCode
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginStroke: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordLabel:UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = UIFont.proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var eyePasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 21))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.tintColor = UIColor.specialDarkGray
        button.addTarget(self, action: #selector(clickEyePasswordButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var eyeRepeatPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 21))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.tintColor = UIColor.specialDarkGray
        button.addTarget(self, action: #selector(clickEyeRepeatPasswordButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = SecureTextFieldFixed()
        textField.isSecureTextEntry = true
        textField.font = UIFont.proDisplay18()
        textField.placeholder = "Введите пароль"
        textField.rightViewMode = .always
        textField.rightView = eyePasswordButton
        textField.delegate = self
        textField.textContentType = .oneTimeCode
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordStroke: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordRepeatLabel:UILabel = {
        let label = UILabel()
        label.text = "Повторить пароль"
        label.font = UIFont.proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordRepeatTextField: UITextField = {
        var textField = SecureTextFieldFixed()
        textField.placeholder = "Повторите пароль"
        textField.font = UIFont.proDisplay18()
        textField.isSecureTextEntry = true
        textField.rightViewMode = .always
        textField.textContentType = .oneTimeCode
        textField.delegate = self
        textField.rightView = eyeRepeatPasswordButton
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordRepeatStroke: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailLabel:UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = UIFont.proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let  textField = UITextField()
        textField.placeholder = "user@example.com"
        textField.font = UIFont.proDisplay18()
        textField.keyboardType = .emailAddress
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailStroke: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 50, width: 340, height: 52))
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Зарегистрироваться", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let optionsLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.proDisplayRegular12()
        label.text = "Или с помощью"
        label.textColor =  .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.isHidden = true
        return label
    }()
    
    private let googleButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.titleAlignment = .center
        filled.baseBackgroundColor = UIColor.white
        filled.imagePlacement = .leading
        filled.imagePadding = 15
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Продолжить с Google", for: .normal)
        button.setTitleColor(UIColor.specialDarkGray, for: .normal)
        button.titleLabel?.font = UIFont.sfProDisplayMedium20()
        button.setImage(UIImage(named: "google"), for: .normal)
        button.layer.borderColor = UIColor.specialGray.cgColor
        button.layer.borderWidth = 1
        button.applyShadow(cornerRadius: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.isEnabled = false
        button.isHidden = true
        return button
    }()
    
    private let appleButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.titleAlignment = .center
        filled.baseBackgroundColor = UIColor.black
        filled.imagePlacement = .leading
        filled.imagePadding = 15
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Продолжить с Apple", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.sfProDisplayMedium20()
        let image = UIImage(named: "apple")
        button.setImage(image, for: .normal)
        button.applyShadow(cornerRadius: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.isEnabled = false
        button.isHidden = true
        return button
    }()
    
    let nameValueType: String.ValueTypes = .name
    let loginValueType: String.ValueTypes = .login
    let emailValueType: String.ValueTypes = .email
    let passwordlValueType: String.ValueTypes = .password
    
    //MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupGradient()
        setConstraints()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(zeroLineView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(userNameLabel)
        scrollView.addSubview(loginStroke)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordStroke)
        
        scrollView.addSubview(userNameTextField)
        scrollView.addSubview(nameLineView)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(passwordRepeatLabel)
        scrollView.addSubview(passwordRepeatStroke)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(emailStroke)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(optionsLabel)
        scrollView.addSubview(googleButton)
        scrollView.addSubview(appleButton)
        scrollView.addSubview(passwordRepeatTextField)
        scrollView.addSubview(emailTextField)
    }
    
    @objc private func registerButtonTapped() {
        let _ = ActivityIndicator.shared.customActivityIndicatory(self.view, startAnimate: true)
        
        guard let userLogin = loginTextField.text,
              let userName = userNameTextField.text,
              let userPassword = passwordTextField.text,
              let userEmailPhone = emailTextField.text
               
//                userNameTextField.isValid(validType: nameValueType)
//                    && loginTextField.isValid(validType: nameValueType)
//                    && userNameTextField.isValid(validType: emailValueType)
//                    && emailTextField.isValid(validType: passwordlValueType)
        else {
            print("UnwrappingError for PhoneEmailTextField")
            return
        }
       
        var parameters: Dictionary<String, String> = [:]
       
        switch regType {
        case .phone:
            print("phone")
        case .email:
            parameters["login"] = userLogin
            parameters["password"] = userPassword
            parameters["user_name"] = userName
            parameters["user_mail"] = userEmailPhone
        }
        
        initRegistration(regType: regType, parameters: parameters, userEmailPhone: userEmailPhone)
    }
    func initRegistration(regType: RegType, parameters: Dictionary<String, String>, userEmailPhone: String) {
        let url: String
        url = URLConstants.createUserEmailURL
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response() { response in
            guard response.error == nil else {
                print(String(describing: response.error?.localizedDescription))
                return
            }
            if response.response!.hasSuccessStatusCode {
                DispatchQueue.main.async {
                    let _ = ActivityIndicator.shared.customActivityIndicatory(self.view, startAnimate: false)
                    let responseTest = response.data
                    let responceStr = String(decoding: response.data!, as: UTF8.self)
                    print("\(String(describing: responseTest))")
                    print("RESPONSE success RECEIVED: \(responceStr)")
                  
                    if responceStr.contains("400") {
                        self.alertOk(title: "Ошибка регистрации", message: "Пользователь с такой почтой уже зарегистрирован ранее")
                        print("email exists!")
                    } else {
                        self.alertOk(title: "Успешная регистрация", message: "Подтвердите email через письмо, отправленное на Ваше почту")
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                            let _ = ActivityIndicator.shared.customActivityIndicatory(self.view, startAnimate: false)
                            let responceStr = String(decoding: response.data!, as: UTF8.self)
                            if responceStr.contains("User already exists") {
                                self.alertOk(title: "Успешная регистрация", message: "Подтвердите email через письмо, отправленное на Ваше почту")
                                print("email exists!")
                            }
                            if (json["message"] as? String) == "email requires confirmation" {
                                print("SUCCESS CONFIRMATION REQUIERED")
                            }
                            if (json["message"] as? String) == "email confirmed" {
                                print("Error in registration")
                            } else {
                                let emailSent = response.data
                                let responceStr = String(decoding: response.data!, as: UTF8.self)
                                print("ERROR RESPONSE RECEIVED: \(String(describing: emailSent))")
                                print("ERROR RESPONSE RECEIVED: \(responceStr)")
                                self.alertOk(title: "Ошибка", message: "Заполните все поля регистрации")
                            }
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValueTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.font = UIFont.proDisplayRegular12()
            label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        } else {
            label.text = wrongMessage
            label.font = UIFont.proDisplayRegular12()
            label.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
    }
    
    @objc func clickEyePasswordButton() {
        passwordTextField.isSecureTextEntry.toggle()
        eyePasswordButton.isSelected.toggle()
    }
    
    @objc func clickEyeRepeatPasswordButton() {
        passwordRepeatTextField.isSecureTextEntry.toggle()
        eyeRepeatPasswordButton.isSelected.toggle()
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
        let colorFirst = #colorLiteral(red: 0.06274509804, green: 0.5803921569, blue: 0.8470588235, alpha: 1).cgColor
        let colorSecond = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1).cgColor
        
        gradient.colors = [colorFirst, colorSecond]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = registerButton.bounds
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.addSublayer(gradient)
        registerButton.titleLabel?.font = .proDisplay16()
    }
}

//MARK: - setConstraints
extension RegisterViewController {
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            zeroLineView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1),
            
            titleLabel.widthAnchor.constraint(equalToConstant: 217),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 10),
            
        //    userNameLabel.widthAnchor.constraint(equalToConstant: 97),
            userNameLabel.heightAnchor.constraint(equalToConstant: 14),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userNameTextField.heightAnchor.constraint(equalToConstant: 30),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            
            loginStroke.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 1),
            loginStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginStroke.heightAnchor.constraint(equalToConstant: 1),
            
            loginLabel.heightAnchor.constraint(equalToConstant: 14),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginLabel.topAnchor.constraint(equalTo: loginStroke.bottomAnchor, constant: 23),
            
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            
            nameLineView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 1),
            nameLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameLineView.heightAnchor.constraint(equalToConstant: 1),
            
        //    passwordLabel.widthAnchor.constraint(equalToConstant: 40),
            passwordLabel.heightAnchor.constraint(equalToConstant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLabel.topAnchor.constraint(equalTo: nameLineView.bottomAnchor, constant: 23),
            
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 1),
            
            passwordStroke.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 1),
            passwordStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordStroke.heightAnchor.constraint(equalToConstant: 1),
            
            passwordRepeatLabel.heightAnchor.constraint(equalToConstant: 14),
            passwordRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordRepeatLabel.topAnchor.constraint(equalTo: passwordStroke.bottomAnchor, constant: 23),
            
            passwordRepeatTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordRepeatTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordRepeatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordRepeatTextField.topAnchor.constraint(equalTo: passwordRepeatLabel.bottomAnchor, constant: 1),
            
            passwordRepeatStroke.topAnchor.constraint(equalTo: passwordRepeatTextField.bottomAnchor, constant: 1),
            passwordRepeatStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordRepeatStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordRepeatStroke.heightAnchor.constraint(equalToConstant: 1),
            
          //  emailLabel.widthAnchor.constraint(equalToConstant: 33),
            emailLabel.heightAnchor.constraint(equalToConstant: 14),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: passwordRepeatStroke.bottomAnchor, constant: 23),
            
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 1),
            
            emailStroke.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 1),
            emailStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailStroke.heightAnchor.constraint(equalToConstant: 1),
            
            registerButton.heightAnchor.constraint(equalToConstant: 38),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -116),
            registerButton.topAnchor.constraint(equalTo: emailStroke.bottomAnchor, constant: 23),
            
            optionsLabel.widthAnchor.constraint(equalToConstant: 84),
            optionsLabel.heightAnchor.constraint(equalToConstant: 14),
            optionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            optionsLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25),
            
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            googleButton.heightAnchor.constraint(equalToConstant: 54),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            googleButton.topAnchor.constraint(equalTo: optionsLabel.bottomAnchor, constant: 16),
            
            appleButton.heightAnchor.constraint(equalToConstant: 54),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            appleButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100),
            appleButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 20)
        ])
    }
}
//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.userNameTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.passwordRepeatTextField.resignFirstResponder()
        return true
    }
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case userNameTextField: setTextField(textField: userNameTextField,
                                              label: userNameLabel,
                                              validType: nameValueType,
                                              validMessage: "Name is valid",
                                              wrongMessage: "Только буквы русского алфавита, мин. 1 буква",
                                              string: string,
                                              range: range)
        case loginTextField: setTextField(textField: loginTextField,
                                               label: loginLabel,
                                               validType: nameValueType,
                                               validMessage: "Name is valid",
                                               wrongMessage: "Только буквы латинского алфавита, мин. 1 буква",
                                               string: string,
                                               range: range)
        case emailTextField: setTextField(textField: emailTextField,
                                          label: emailLabel,
                                          validType: emailValueType,
                                          validMessage: "Email is valid",
                                          wrongMessage: "Email is not valid",
                                          string: string,
                                          range: range)
        case passwordTextField: setTextField(textField: passwordTextField,
                                             label: passwordLabel,
                                             validType: passwordlValueType,
                                             validMessage: "Password is valid",
                                             wrongMessage: "Password is not valid",
                                             string: string,
                                             range: range)
        default:
            break
        }
        
        return false
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return true
//    }
}
