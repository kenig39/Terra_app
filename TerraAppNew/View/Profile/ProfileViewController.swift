//
//  ViewController.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 27.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let profileBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = #colorLiteral(red: 0.6306069624, green: 0.7299163626, blue: 1, alpha: 1)
        view.image = UIImage(named: "background_profile")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "man_avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Имя Фамилия, Мои Контакты
    
    private let userName = UILabel(text: "Иванов Иван",
                                   font: .systemFont(ofSize: 24),
                                   textColor: .black,
                                   line: 0)
    
    private let mainTelegramName = UILabel(text: "@iv.iv.",
                                           font: .systemFont(ofSize: 18),
                                           textColor: #colorLiteral(red: 0.2245052159, green: 0.6220973134, blue: 0.9667814374, alpha: 1),
                                           line: 0)
    
    
    //    тут будут синие овалы
    
    private let firstHashtagLabel: UILabel = {
       let label = UILabel()
        label.text = "   #МишаЖиви   "
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.3322852403, green: 0.6049768614, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondHashtagLabel: UILabel = {
       let label = UILabel()
        label.text = "   #Два   "
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.3322852403, green: 0.6049768614, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdHashtagLabel: UILabel = {
       let label = UILabel()
        label.text = "   #Три   "
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.3322852403, green: 0.6049768614, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let myContatsLabel = UILabel(text: "Мои контакты",
                                         font: .systemFont(ofSize: 18),
                                         textColor: .black,
                                         line: 0)
    
    private let phoneIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "phone_Icon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneNumber = UILabel(text: "8 910 123 45 67",
                                      font: .systemFont(ofSize: 14),
                                      textColor: .black, line: 0)
    
    
    private let telegramIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "telega_Icon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let telegramId = UILabel(text: "@iv.iv.",
                                     font: .systemFont(ofSize: 14),
                                     textColor: .black,
                                     line: 0)
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - О Себе, город, день рождения, интересы
    
    private let aboutLabel = UILabel(text: "О себе",
                                     font: .systemFont(ofSize: 18),
                                     textColor: .black,
                                     line: 0)
    
    private let cityLabel = UILabel(text: "Город",
                                    font: .systemFont(ofSize: 12),
                                    textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                    line: 0)
    
    private let cityNameLabel = UILabel (text: "Город",
                                         font: .systemFont(ofSize: 14),
                                         textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                         line: 0)
    
    private let birthdayLabel = UILabel(text: "День рождения",
                                        font: .systemFont(ofSize: 12),
                                        textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                        line: 0)
    
    private let birthdayNameLabel = UILabel (text: "День рождения",
                                             font: .systemFont(ofSize: 14),
                                             textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                             line: 0)
    
    private let interestsLabel = UILabel(text: "Интересы",
                                         font: .systemFont(ofSize: 12),
                                         textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                         line: 0)
    
    private let interestsNameLabel = UILabel (text: "Интересы",
                                              font: .systemFont(ofSize: 14),
                                              textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                              line: 0)
    
    private let aboutDescription = UILabel(text: "О себе",
                                           font: .systemFont(ofSize: 14),
                                           textColor: .black,
                                           line: 0)
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Чем могу быть полезен, ресурсы, экспертиза
    
    private let canHelpfulLabel = UILabel(text: "Чем могу быть полезен",
                                          font: .systemFont(ofSize: 18),
                                          textColor: .black,
                                          line: 0)
    
    private let resourcesLabel = UILabel(text: "Ресурсы",
                                         font: .systemFont(ofSize: 12),
                                         textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                         line: 0)
    
    private let resourcesNameLabel = UILabel (text: "Ресурсы",
                                              font: .systemFont(ofSize: 14),
                                              textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                              line: 0)
    
    private let expertiseLabel = UILabel(text: "Экспертиза",
                                         font: .systemFont(ofSize: 12),
                                         textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                         line: 0)
    
    private let expertiseNameLabel = UILabel (text: "Экспертиза",
                                              font: .systemFont(ofSize: 14),
                                              textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                              line: 0)
    
    private let thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let whatImLooking = UILabel(text: "Что я ищу", font: .systemFont(ofSize: 18), textColor: .black, line: 0)
    
    private let goalOnYearLabel = UILabel(text: "Цель на год",
                                          font: .systemFont(ofSize: 12),
                                          textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                          line: 0)
    private let goalOnYearNameLabel = UILabel (text: "Цель на год",
                                              font: .systemFont(ofSize: 14),
                                              textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                              line: 0)
    private let commentsLabel = UILabel(text: "Комментарий",
                                          font: .systemFont(ofSize: 12),
                                          textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1),
                                          line: 0)
    private let commentsNameLabel = UILabel (text: "Комментарий",
                                              font: .systemFont(ofSize: 14),
                                              textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                              line: 0)
    
    private let fourLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let myCompanyLabel = UILabel(text: "Мои компании", font: .systemFont(ofSize: 18), textColor: .black, line: 0)
    
    private let myCompanyViewOne = MyCompanyView()
    private let myCompanyViewTwo = MyCompanyView()
    
    
    private var hashtagStackView = UIStackView()
    private var cityStackView = UIStackView()
    private var birthdayStackView = UIStackView()
    private var interestsStackView = UIStackView()
    private var resourcesStackView = UIStackView()
    private var expertiseStackView = UIStackView()
    private var goalStackView = UIStackView()
    private var commentsStackView = UIStackView()
    
    override func viewDidLayoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }


//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            backButtonLabel()
//        }


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(openSettingsTap))
        
        setupViews()
        setConstraints()
    }
//
//    private func backButtonLabel(){
//            let backButton = UIBarButtonItem()
//            backButton.title = "ОТмена"
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        }

    
    private func setupViews() {
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(openSettingsTap))
        
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
        hashtagStackView = UIStackView(arrangedSubviews: [firstHashtagLabel, secondHashtagLabel, thirdHashtagLabel], axis: .horizontal, spacing: 15)
        
        birthdayStackView = UIStackView(arrangedSubviews: [birthdayLabel,birthdayNameLabel],
                                        axis: .vertical,
                                        spacing: 7)
        
        interestsStackView = UIStackView(arrangedSubviews: [interestsLabel, interestsNameLabel],
                                         axis: .vertical,
                                         spacing: 7)
        
        resourcesStackView = UIStackView(arrangedSubviews: [resourcesLabel, resourcesNameLabel],
                                         axis: .vertical,
                                         spacing: 7)
        
        expertiseStackView = UIStackView(arrangedSubviews: [expertiseLabel, expertiseNameLabel],
                                         axis: .vertical,
                                         spacing: 7)
        
        cityStackView = UIStackView(arrangedSubviews: [cityLabel, cityNameLabel],
                                    axis: .vertical,
                                    spacing: 7)
        
        goalStackView = UIStackView(arrangedSubviews: [goalOnYearLabel, goalOnYearNameLabel],
                                    axis: .vertical,
                                    spacing: 7)
        
        commentsStackView = UIStackView(arrangedSubviews: [commentsLabel, commentsNameLabel],
                                        axis: .vertical,
                                        spacing: 7)
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(profileBackgroundImage)
        scrollView.addSubview(avatarImageView)
     //   scrollView.addSubview(settingsButton)
        
        scrollView.addSubview(userName)
        scrollView.addSubview(mainTelegramName)
        scrollView.addSubview(hashtagStackView)
        
        scrollView.addSubview(myContatsLabel)
        scrollView.addSubview(phoneIcon)
        scrollView.addSubview(phoneNumber)
        scrollView.addSubview(telegramIcon)
        scrollView.addSubview(telegramId)
        scrollView.addSubview(firstLineView)
        
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(cityStackView)
        scrollView.addSubview(birthdayStackView)
        scrollView.addSubview(interestsStackView)
        scrollView.addSubview(aboutDescription)
        scrollView.addSubview(secondLineView)
        scrollView.addSubview(canHelpfulLabel)
        scrollView.addSubview(resourcesStackView)
        scrollView.addSubview(expertiseStackView)
        scrollView.addSubview(thirdLineView)
        
        scrollView.addSubview(whatImLooking)
        scrollView.addSubview(goalStackView)
        scrollView.addSubview(commentsStackView)
        scrollView.addSubview(fourLineView)
        scrollView.addSubview(myCompanyLabel)
        
        scrollView.addSubview(myCompanyViewOne)
        scrollView.addSubview(myCompanyViewTwo)
    }
    
    @objc private func openSettingsTap() {
        let editViewController = EditViewController()
        navigationController?.pushViewController(editViewController, animated: true)

//        self.navigationController?.pushViewController(editViewController, animated: true)
//        editViewController.modalPresentationStyle = .fullScreen
    }
}
//MARK: - SetConstraints

extension ProfileViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
//        NSLayoutConstraint.activate([
//            settingsButton.topAnchor.constraint(equalTo: profileBackgroundImage.topAnchor, constant: 50),
//            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
//            settingsButton.heightAnchor.constraint(equalToConstant: 26),
//            settingsButton.widthAnchor.constraint(equalToConstant: 26)
//        ])
//
        NSLayoutConstraint.activate([
            profileBackgroundImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            profileBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileBackgroundImage.heightAnchor.constraint(equalToConstant: 179)
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: profileBackgroundImage.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: profileBackgroundImage.bottomAnchor, constant: -90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainTelegramName.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8),
            mainTelegramName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hashtagStackView.topAnchor.constraint(equalTo: mainTelegramName.bottomAnchor, constant: 24),
            hashtagStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hashtagStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            myContatsLabel.topAnchor.constraint(equalTo: mainTelegramName.bottomAnchor, constant: 100),
            myContatsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            phoneIcon.topAnchor.constraint(equalTo: myContatsLabel.bottomAnchor, constant: 20),
            phoneIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumber.topAnchor.constraint(equalTo: myContatsLabel.bottomAnchor, constant: 23),
            phoneNumber.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            telegramIcon.topAnchor.constraint(equalTo: phoneIcon.bottomAnchor, constant: 23),
            telegramIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            telegramId.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 31),
            telegramId.leadingAnchor.constraint(equalTo: telegramIcon.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            firstLineView.topAnchor.constraint(equalTo: telegramIcon.bottomAnchor, constant: 28),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 24),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            cityStackView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 15),
            cityStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            birthdayStackView.topAnchor.constraint(equalTo: cityStackView.bottomAnchor, constant: 15),
            birthdayStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            birthdayStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            interestsStackView.topAnchor.constraint(equalTo: birthdayStackView.bottomAnchor, constant: 15),
            interestsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            interestsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            aboutDescription.topAnchor.constraint(equalTo: interestsStackView.bottomAnchor, constant: 15),
            aboutDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            aboutDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: aboutDescription.bottomAnchor, constant: 24),
            secondLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //   secondLineView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            secondLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            canHelpfulLabel.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 24),
            canHelpfulLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            canHelpfulLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            resourcesStackView.topAnchor.constraint(equalTo: canHelpfulLabel.bottomAnchor, constant: 15),
            resourcesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resourcesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            expertiseStackView.topAnchor.constraint(equalTo: resourcesStackView.bottomAnchor, constant: 15),
            expertiseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            thirdLineView.topAnchor.constraint(equalTo: expertiseStackView.bottomAnchor, constant: 24),
            thirdLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            thirdLineView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            whatImLooking.topAnchor.constraint(equalTo: thirdLineView.bottomAnchor, constant: 24),
            whatImLooking.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            goalStackView.topAnchor.constraint(equalTo: whatImLooking.bottomAnchor, constant: 15),
            goalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            commentsStackView.topAnchor.constraint(equalTo: goalStackView.bottomAnchor, constant: 15),
            commentsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            fourLineView.topAnchor.constraint(equalTo: commentsStackView.bottomAnchor, constant: 24),
            fourLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fourLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            thirdLineView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            fourLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            myCompanyLabel.topAnchor.constraint(equalTo: fourLineView.bottomAnchor, constant: 24),
            myCompanyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            myCompanyViewOne.topAnchor.constraint(equalTo: myCompanyLabel.bottomAnchor, constant: 24),
            myCompanyViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myCompanyViewOne.heightAnchor.constraint(equalToConstant: 80),
            myCompanyViewOne.widthAnchor.constraint(equalToConstant: 170),
            myCompanyViewOne.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            myCompanyViewTwo.topAnchor.constraint(equalTo: myCompanyLabel.bottomAnchor, constant: 24),
            myCompanyViewTwo.leadingAnchor.constraint(equalTo: myCompanyViewOne.trailingAnchor, constant: 20),
            myCompanyViewTwo.heightAnchor.constraint(equalToConstant: 80),
            myCompanyViewTwo.widthAnchor.constraint(equalToConstant: 170),
            myCompanyViewTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
}
