//
//  ProjectsTerraViewController.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 29.07.2022.
//

import UIKit

class ProjectsTerraViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //MARK: - Labels
    
    private let projectsLabel = UILabel(text: "Проекты Terra",
                                        font: .proDisplayBold18(),
                                        color: .specialBlack,
                                        line: 0)
    
    private let firstLabel = UILabel(text: "Terra Мастер-класс",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let firstInfoLabel = UILabel(text: "Обучающие МК от топовых спикеров каждый четверг в Москва-Сити",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let secondLabel = UILabel(text: "Школа управления",
                                      font: .proDisplay18(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let secondInfoLabel = UILabel(text: "Добавляем после личного собеседования с руководителем данного проекта",
                                          font:  .proDisplayRegular12(),
                                          color: .specialDarkGray,
                                          line: 0)
    
    private let thirdLabel = UILabel(text: "Terra Мафия",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let thirdInfoLabel = UILabel(text: "Развивающие игры в мафию оффлайн",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let fourhLabel = UILabel(text: "Terra Управленческие поединки",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fourhInfoLabel = UILabel(text: "Управленческий поединок (УП) - это ролевая управлен-ческая игра, погружающая Вас в конфликтные и острые бизнес-переговоры, дающая возможность обрести навык отстаивания и достижения своих интересов",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let fifthLabel = UILabel(text: "Terra HR",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fifthInfoLabel = UILabel(text: "Обучающие МК от топовых спикеров каждый четверг в Москва-Сити",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let sixLabel = UILabel(text: "Terra English",
                                   font: .proDisplay18(),
                                   color: .specialBlack,
                                   line: 0)
    
    private let sixInfoLabel = UILabel(text: "Английский язык",
                                       font:  .proDisplayRegular12(),
                                       color: .specialDarkGray,
                                       line: 0)
    
    private let sevenLabel = UILabel(text: "Terra Онлайн-Школа",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let sevenInfoLabel = UILabel(text: "Онлайн-школа на платформе GetCourse",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    //MARK: - Buttons
    
    private lazy var tlgTMCButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgTMCButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgSchollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgSchollButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgMafiaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon"), for: .normal) //?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgMafiaButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgUprBatteleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgUprBatteleButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgHRButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgHRButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgEnglishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgEnglishButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tlgOnlineSchoolButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tlgOnlineSchoolButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lines
    
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
    
    private let fourLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fiveLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sixthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sevenLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var firstStackView = UIStackView()
    private var secoundStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var fourStackView = UIStackView()
    private var fifthStackView = UIStackView()
    private var sixthStackView = UIStackView()
    private var sevenStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [firstLabel,
                                         firstInfoLabel,
                                         firstLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        secoundStackView = UIStackView(arrangedSubviews:
                                        [secondLabel,
                                         secondInfoLabel,
                                         secondLineView],
                                       axis: .vertical,
                                       spacing: 1)
        
        thirdStackView = UIStackView(arrangedSubviews:
                                        [thirdLabel,
                                         thirdInfoLabel,
                                         thirdLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        fourStackView = UIStackView(arrangedSubviews:
                                        [fourhLabel,
                                         fourhInfoLabel,
                                         fourLineView],
                                    axis: .vertical,
                                    spacing: 1)
        
        fifthStackView = UIStackView(arrangedSubviews:
                                        [fifthLabel,
                                         fifthInfoLabel,
                                         fiveLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        sixthStackView = UIStackView(arrangedSubviews:
                                        [sixLabel,
                                         sixInfoLabel,
                                         sixthLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        sevenStackView = UIStackView(arrangedSubviews:
                                        [sevenLabel,
                                         sevenInfoLabel,
                                         sevenLineView],
                                     axis: .vertical,
                                     spacing: 1)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        setupUIStackView()
        view.addSubview(eightLineView)
        view.addSubview(scrollView)
        scrollView.addSubview(projectsLabel)
        scrollView.addSubview(firstStackView)
        scrollView.addSubview(secoundStackView)
        scrollView.addSubview(thirdStackView)
        scrollView.addSubview(fourStackView)
        scrollView.addSubview(fifthStackView)
        scrollView.addSubview(sixthStackView)
        scrollView.addSubview(sevenStackView)
        scrollView.addSubview(tlgTMCButton)
        scrollView.addSubview(tlgSchollButton)
        scrollView.addSubview(tlgMafiaButton)
        scrollView.addSubview(tlgUprBatteleButton)
        scrollView.addSubview(tlgHRButton)
        scrollView.addSubview(tlgEnglishButton)
        scrollView.addSubview(tlgOnlineSchoolButton)
    }
    //MARK: - Buttons func
    
    @objc private func tlgTMCButtonTap() {
        print("tlgTMCButtonTap")
    }
    
    @objc private func tlgSchollButtonTap() {
        print("tlgSchollButtonTap")
    }
    
    @objc private func tlgMafiaButtonTap() {
        print("tlgMafiaButton")
    }
    
    @objc private func tlgUprBatteleButtonTap() {
        print("tlgUprBatteleButtonTap")
    }
    
    @objc private func tlgHRButtonTap() {
        print("tlgHRButtonTap")
    }
    
    @objc private func tlgEnglishButtonTap() {
        print("tlgEnglishButtonTap")
    }
    
    @objc private func tlgOnlineSchoolButtonTap() {
        print("tlgOnlineSchoolButtonTap")
    }
}
//MARK: - SetConstraints

extension ProjectsTerraViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            eightLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            eightLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eightLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            eightLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: eightLineView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            projectsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            projectsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            projectsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: 23),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            firstStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            secoundStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10),
            secoundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            secoundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            secoundStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            fourLineView.heightAnchor.constraint(equalToConstant: 1),
            fiveLineView.heightAnchor.constraint(equalToConstant: 1),
            sixthLineView.heightAnchor.constraint(equalToConstant: 1),
            sevenLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: secoundStackView.bottomAnchor, constant: 10),
            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            thirdStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            fourStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 10),
            fourStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fourStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fourStackView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            fifthStackView.topAnchor.constraint(equalTo: fourStackView.bottomAnchor, constant: 10),
            fifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fifthStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            sixthStackView.topAnchor.constraint(equalTo: fifthStackView.bottomAnchor, constant: 10),
            sixthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            sixthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            sixthStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            sevenStackView.topAnchor.constraint(equalTo: sixthStackView.bottomAnchor, constant: 10),
            sevenStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            sevenStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            sevenStackView.heightAnchor.constraint(equalToConstant: 70),
            sevenStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            tlgTMCButton.centerYAnchor.constraint(equalTo: firstStackView.centerYAnchor),
            tlgTMCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgTMCButton.heightAnchor.constraint(equalToConstant: 18),
            tlgTMCButton.widthAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            tlgSchollButton.centerYAnchor.constraint(equalTo: secoundStackView.centerYAnchor),
            tlgSchollButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgSchollButton.heightAnchor.constraint(equalToConstant: 18),
            tlgSchollButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            tlgMafiaButton.centerYAnchor.constraint(equalTo: thirdStackView.centerYAnchor),
            tlgMafiaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgMafiaButton.heightAnchor.constraint(equalToConstant: 18),
            tlgMafiaButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            tlgUprBatteleButton.centerYAnchor.constraint(equalTo: fourStackView.centerYAnchor),
            tlgUprBatteleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgUprBatteleButton.heightAnchor.constraint(equalToConstant: 18),
            tlgUprBatteleButton.widthAnchor.constraint(equalToConstant: 19)
        ])
        NSLayoutConstraint.activate([
            tlgHRButton.centerYAnchor.constraint(equalTo: fifthStackView.centerYAnchor),
            tlgHRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgHRButton.heightAnchor.constraint(equalToConstant: 18),
            tlgHRButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            tlgEnglishButton.centerYAnchor.constraint(equalTo: sixthStackView.centerYAnchor),
            tlgEnglishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgEnglishButton.heightAnchor.constraint(equalToConstant: 18),
            tlgEnglishButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            tlgOnlineSchoolButton.centerYAnchor.constraint(equalTo: sevenStackView.centerYAnchor),
            tlgOnlineSchoolButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tlgOnlineSchoolButton.heightAnchor.constraint(equalToConstant: 18),
            tlgOnlineSchoolButton.widthAnchor.constraint(equalToConstant: 19)
        ])
    }
}
