//
//  SchoolOfManagViewController.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 30.07.2022.
//

import UIKit

class SchoolOfManagViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private lazy var developmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("События", for: .normal)
        // button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.titleLabel?.font = .proDisplay18()
        button.addTarget(self, action: #selector(developmentButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var arrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(developmentButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let terraClubLabel = UILabel(text: "TerraClub", font: .systemFont(ofSize: 11, weight: .regular), color: .black, line: 1)
    
    private let ellipsePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_TerraClub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - LineView
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Labels
    
    private let schoolOfManagLabel = UILabel(text: "Школа управления",
                                             font: .proDisplayBold24(),
                                             color: .specialBlack,
                                             line: 0)
    
    private let regLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация на мероприятие"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .proDisplayBold14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let regLabelImageView: UILabel = {
        let label = UILabel()
        label.text = ""
        label.addImage(imageName: "SchoolOfManagVC2")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12:00 Вс, 1 мая 2022"
        label.textColor = .black
        label.font = .proDisplayBold14()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dataLabelImageView: UILabel = {
        let label = UILabel()
        label.text = ""
        label.addImage(imageName: "SchoolOfManagVC1")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Мясницкая 13, стр. 11"
        label.textColor = .black
        label.font = .proDisplayBold14()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabelImageView: UILabel = {
        let label = UILabel()
        label.text = ""
        label.addImage(imageName: "SchoolOfManagVC3")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spikerLabel = UILabel(text: "Спикер",
                                      font: .proDisplayRegular12(),
                                      color: .specialDarkGray,
                                      line: 0)
    
    private let nameLabel = UILabel(text: "Имя Фамилия",
                                    font: .proDisplayBold14(),
                                    color: .specialBlack,
                                    line: 0)
    
    private let postSpikerLabel = UILabel(text: "Должность",
                                          font: .proDisplayRegular14(),
                                          color: .specialBlack,
                                          line: 0)
    
    private let schoolNameLabel = UILabel(text: "Школа управления",
                                          font: .proDisplayRegular14(),
                                          color: .specialBlack,
                                          line: 0)
    
    private let schoolSpikerLabel = UILabel(text: "Спикер:",
                                            font: .proDisplayRegular14(),
                                            color: .specialBlack,
                                            line: 0)
    
    private let placeLessonLabel = UILabel(text: "Место:",
                                           font: .proDisplayRegular14(),
                                           color: .specialBlack,
                                           line: 0)
    
    private let startLessonLabel = UILabel(text: "Начало занятий:",
                                           font: .proDisplayRegular14(),
                                           color: .specialBlack,
                                           line: 0)
    
    private let enterLessonLabel = UILabel(text: "Вход по заведомо заказанным пропускам!",
                                           font: .proDisplayRegular14(),
                                           color: .specialBlack,
                                           line: 0)
    
    private let timeRegLabel = UILabel(text: "Период регистрации: 17 апр. 2022 - 1 мая 2022",
                                       font: .proDisplayRegular12(),
                                       color: .specialDarkGray,
                                       line: 0)
    
    private let hashtagLabel = UILabel(text: "#хештег #хештег",
                                       font: .proDisplayRegular14(),
                                       color: .specialBlue,
                                       line: 0)
    
    //MARK: - Buttons
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "SchoolOfManagVC_plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 50, width: 340, height: 52))
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var spikerPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foto")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var fifthStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setupGradient()
    }
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [regLabel,
                                         dateLabel,
                                         addressLabel
                                        ],
                                     axis: .vertical,
                                     spacing: 10)
        
        secondStackView = UIStackView(arrangedSubviews:
                                        [spikerLabel,
                                         nameLabel,
                                         postSpikerLabel],
                                      axis: .vertical,
                                      spacing: 5)
        
        thirdStackView = UIStackView(arrangedSubviews:
                                        [schoolNameLabel,
                                         schoolSpikerLabel,
                                         placeLessonLabel,
                                         startLessonLabel,
                                         enterLessonLabel],
                                     axis: .vertical,
                                     spacing: 5)
        
        self.timeRegLabel.textAlignment = .center
        
        fifthStackView = UIStackView(arrangedSubviews:
                                        [hashtagLabel,
                                         thirdLineView],
                                     axis: .vertical,
                                     spacing: 20)
    }
    
    override func viewDidLayoutSubviews() {
        spikerPhotoImageView.layer.cornerRadius = spikerPhotoImageView.frame.height / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(scrollView)
       // scrollView.addSubview(contentView)
        setupUIStackView()
        
        scrollView.addSubview(arrowButton)
        scrollView.addSubview(schoolOfManagLabel)
        
        scrollView.addSubview(firstLineView)
        scrollView.addSubview(secondLineView)
        scrollView.addSubview(regLabelImageView)
        scrollView.addSubview(dataLabelImageView)
        scrollView.addSubview(addressLabelImageView)
        scrollView.addSubview(firstStackView)
        scrollView.addSubview(plusButton)
        
        scrollView.addSubview(spikerPhotoImageView)
        scrollView.addSubview(secondStackView)
        scrollView.addSubview(thirdStackView)
        scrollView.addSubview(fifthStackView)
        
        scrollView.addSubview(registButton)
        scrollView.addSubview(timeRegLabel)
    }
    
    @objc private func plusButtonTap() {
        alertOkCancel(title: "Добавить событие в календарь?", message: "") {
            self.dismiss(animated: true)
        }
    }
    
    @objc private func registButtonTap() {
        print("registButtonTap")
    }
    
    @objc func developmentButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupVC(model: SchoolEventModel) {
        schoolOfManagLabel.text = model.schoolName
        spikerPhotoImageView.image = model.speakerImage
        
        nameLabel.text = model.speakerName
        postSpikerLabel.text = model.speakerPosition
        hashtagLabel.text = model.hashtagsInfo
        
        schoolNameLabel.text = model.schoolName
        schoolSpikerLabel.text = "Спикер:  " + model.speakerName
        placeLessonLabel.text = "Место:  " + (addressLabel.text ?? "Адрес уточняется")
        startLessonLabel.text = "Начало занятия:  " + (dateLabel.text ?? "Дата уточняется")
    }
    
    private func setupGradient() {
        
        let gradient = CAGradientLayer()
        let colorFirst = #colorLiteral(red: 0.06274509804, green: 0.5803921569, blue: 0.8470588235, alpha: 1).cgColor
        let colorSecond = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1).cgColor
        
        gradient.colors = [colorFirst, colorSecond]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = registButton.bounds
        registButton.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        registButton.setTitleColor(.white, for: .normal)
        registButton.setTitle("Зарегистрироваться", for: .normal)
        registButton.layer.addSublayer(gradient)
        registButton.titleLabel?.font = .proDisplay20()
    }
}

//MARK: - SetConstraints

extension SchoolOfManagViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
        //    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//          //  contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            arrowButton.topAnchor.constraint(equalTo: scrollView.topAnchor),
            arrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            arrowButton.widthAnchor.constraint(equalToConstant: 20),
            arrowButton.heightAnchor.constraint(equalToConstant: 20),
            
            schoolOfManagLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            schoolOfManagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            schoolOfManagLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            firstLineView.topAnchor.constraint(equalTo: schoolOfManagLabel.bottomAnchor, constant: 20),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            regLabelImageView.topAnchor.constraint(equalTo: schoolOfManagLabel.bottomAnchor, constant: 48),
            regLabelImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            regLabelImageView.widthAnchor.constraint(equalToConstant: 20),
            regLabelImageView.heightAnchor.constraint(equalToConstant: 30),
            
            firstStackView.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 32),
            firstStackView.leadingAnchor.constraint(equalTo: regLabelImageView.trailingAnchor, constant: 17),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstStackView.heightAnchor.constraint(equalToConstant: 140),
            
            plusButton.centerYAnchor.constraint(equalTo: dataLabelImageView.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            plusButton.widthAnchor.constraint(equalToConstant: 23),
            plusButton.heightAnchor.constraint(equalToConstant: 23),
            
            secondLineView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 20),
            secondLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            dataLabelImageView.topAnchor.constraint(equalTo: regLabelImageView.bottomAnchor, constant: 30),
            dataLabelImageView.centerXAnchor.constraint(equalTo: regLabelImageView.centerXAnchor),
            dataLabelImageView.widthAnchor.constraint(equalToConstant: 30),
            dataLabelImageView.heightAnchor.constraint(equalToConstant: 30),
            
            addressLabelImageView.topAnchor.constraint(equalTo: dataLabelImageView.bottomAnchor, constant: 30),
            addressLabelImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            addressLabelImageView.widthAnchor.constraint(equalToConstant: 30),
            addressLabelImageView.heightAnchor.constraint(equalToConstant: 35),
            
            spikerPhotoImageView.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 24),
            spikerPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            spikerPhotoImageView.widthAnchor.constraint(equalToConstant: 50),
            spikerPhotoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            secondStackView.centerYAnchor.constraint(equalTo: spikerPhotoImageView.centerYAnchor),
            secondStackView.leadingAnchor.constraint(equalTo: spikerPhotoImageView.trailingAnchor, constant: 12),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          //  secondLineView.heightAnchor.constraint(equalToConstant: 100),
            
            fifthStackView.topAnchor.constraint(equalTo: spikerPhotoImageView.bottomAnchor, constant: 24),
            fifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            thirdStackView.topAnchor.constraint(equalTo: fifthStackView.bottomAnchor, constant: 24),
            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdStackView.heightAnchor.constraint(equalToConstant: 140),
            
          //  registButton.widthAnchor.constraint(equalToConstant: 310),
           // registButton.heightAnchor.constraint(equalToConstant: 45),
            registButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            registButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            registButton.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 30),
            
            timeRegLabel.topAnchor.constraint(equalTo: registButton.bottomAnchor, constant: 8),
            timeRegLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            timeRegLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeRegLabel.heightAnchor.constraint(equalToConstant: 15),
            timeRegLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
