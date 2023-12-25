//
//  LoginViewController.swift
//  TerraAppNew
//
//  Created by Tilek Koszhanov on 7/26/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LaunchScreen")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smallImageLabel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let actionLabel:UILabel = {
        let label = UILabel()
        label.text = "Введите данные"
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
    
    private let passwordLabel:UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = .proDisplayRegular12()
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя/логин пользователя"
        textField.font = UIFont.proDisplay18()
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = SecureTextFieldFixed()
        textField.placeholder = "Введите пароль"
        textField.font = UIFont.proDisplay18()
        textField.isSecureTextEntry = true
        textField.rightViewMode = .always
        textField.textContentType = .password
        textField.rightView = eyePasswordButton
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginStroke: UIView = {
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
    
    private let passwordStroke: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let optionsLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.proDisplayRegular12()
        label.text = "Или с помощью"
        label.textColor = .specialDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.isHidden = true
        return label
    }()
    
    private lazy var eyePasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 25,
                                            height: 21))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.tintColor = UIColor.specialDarkGray
        button.addTarget(self,
                         action: #selector(clickEyePasswordButton),
                         for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10,
                                            y: 50,
                                            width: 340,
                                            height: 52))
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Войти", for: .normal)
  //      button.addTarget(self,
    //                     action: #selector(pressEnterButton),
      //                   for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        button.isEnabled = false
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    //MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupGradient()
        setConstraints()
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(zeroLineView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(actionLabel)
        scrollView.addSubview(userNameLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(loginStroke)
        scrollView.addSubview(passwordStroke)
        scrollView.addSubview(enterButton)
        scrollView.addSubview(optionsLabel)
        scrollView.addSubview(googleButton)
        scrollView.addSubview(appleButton)
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
        enterButton.titleLabel?.font = .proDisplay16()
    }
    
    //MARK: - ButtonsActions
    
 //   @objc func pressEnterButton() {
   //     let nextVc = MainTabBarController()
     //   nextVc.modalPresentationStyle = .fullScreen
       // present(nextVc, animated: true)
    //}
    
    @objc private func enterButtonTapped() {
        let _ = ActivityIndicator.shared.customActivityIndicatory(self.view, startAnimate: true)
        let username = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        let user: Dictionary<String, Any> = [
            "login": username,
            "password": password
        ]
      loginRequest(dic: user)
    }
    func loginRequest(dic: Dictionary<String, Any>) {
        let url = URLConstants.loginURL
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }
        AF.request(url, method: .post, parameters: dic, encoding: JSONEncoding.default, headers: ["Device-ID": deviceID]).response() { response in
       
            guard response.error == nil else {
                print(String(describing: response.error?.localizedDescription))
                return
            }
            if response.response!.hasSuccessStatusCode {
                DispatchQueue.main.async { [self] in
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                            let emailSent = response.data
                            let _ = ActivityIndicator.shared.customActivityIndicatory(self.view, startAnimate: false)
                            let responceStr = String(decoding: response.data!, as: UTF8.self)
                            UserDefaultsManager().set(key: .detail, value: (json["detail"] as! Dictionary<String, Any>))
                            let userDetails: [String: String] = UserDefaults.standard.object(forKey: "detail") as! [String : String]
                            guard let userAccessToken: String = userDetails["access_token"] else { return }
                            UserSettings.shared.access_token = userAccessToken
                            print("USER ACCESS TOKEN IS \(userAccessToken)")
                            print("DATA RECEIVED: \(String(describing: emailSent))")
                            print("RESPONSE DECODED: \(responceStr)")
                 
                            if responceStr.contains("500") || responceStr.contains("403")  {
                                self.showAlert()
                            } else {
                                Router.shared.navigateToVC(MainTabBarController())
                            }
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                        return
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    do {
                        if let _ = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
  
    @objc func pressGoogleButton() {
       
    }
    
    @objc func pressAppleButton() {
        let nextVc = MainTabBarController()
        nextVc.modalPresentationStyle = .fullScreen
        present(nextVc, animated: true)
    }
    
    @objc func clickEyePasswordButton() {
        passwordTextField.isSecureTextEntry.toggle()
        eyePasswordButton.isSelected.toggle()
    }
    
    //MARK: - SetConstraints
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
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 151),
            logoImageView.heightAnchor.constraint(equalToConstant: 96),
            logoImageView.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 45),
            
           // actionLabel.widthAnchor.constraint(equalToConstant: 190),
            actionLabel.heightAnchor.constraint(equalToConstant: 29),
            actionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            actionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            
           // userNameLabel.widthAnchor.constraint(equalToConstant: 97),
            userNameLabel.heightAnchor.constraint(equalToConstant: 14),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo:actionLabel.bottomAnchor, constant: 16),
            
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            
            loginStroke.topAnchor.constraint(equalTo:  loginTextField.bottomAnchor, constant: 2),
            loginStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginStroke.heightAnchor.constraint(equalToConstant: 1),
            
           // passwordLabel.widthAnchor.constraint(equalToConstant: 40),
            passwordLabel.heightAnchor.constraint(equalToConstant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLabel.topAnchor.constraint(equalTo: loginStroke.bottomAnchor, constant: 20),
            
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            
            passwordStroke.topAnchor.constraint(equalTo:  passwordTextField.bottomAnchor, constant: 2),
            passwordStroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordStroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordStroke.heightAnchor.constraint(equalToConstant: 1),
            
            enterButton.widthAnchor.constraint(equalToConstant: 117),
            enterButton.heightAnchor.constraint(equalToConstant: 38),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterButton.topAnchor.constraint(equalTo: passwordStroke.bottomAnchor, constant: 23),
            
           // optionsLabel.widthAnchor.constraint(equalToConstant: 84),
            optionsLabel.heightAnchor.constraint(equalToConstant: 14),
            optionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            optionsLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 25),
            
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
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

