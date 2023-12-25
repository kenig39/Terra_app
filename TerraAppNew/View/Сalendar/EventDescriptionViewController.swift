//
//  EventDescriptionViewController.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 03.08.2022.
//

import UIKit

class EventDescriptionViewController: UIViewController {
   
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let eventName = UILabel(text: "Школа управления",
                                    font: .systemFont(ofSize: 24),
                                    textColor: .black,
                                    line: 0)
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let statusEventIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "statusEvent_Icon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    private let statusEvent = UILabel(text: "Регистрация на мероприятие", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    // -- -- --
    
    private let calendarIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "calendar_icon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    private let calendarDate = UILabel(text: "12:00 Вс, 1 мая 2022", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    // -- -- --
    
    private let meetingPointIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "meetingPoint_Icon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    private let meetingPointLabel = UILabel(text: "Мясницкая 13, стр. 11", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    // -- -- --
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let speackerAvatar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "speacker_avatar")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let speackerLabel = UILabel(text: "Спикер", font: .systemFont(ofSize: 12), textColor: #colorLiteral(red: 0.7061325908, green: 0.7061325908, blue: 0.7061325908, alpha: 1), line: 0)
    private let nameSpeackerLabel = UILabel(text: "Расулов Шухрат", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    private let descriptionSpeacker = UILabel(text: "Основатель TERRA", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    private let hashtagLabel = UILabel(text: "#terraclub #школа_управления", font: .systemFont(ofSize: 11), textColor: #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1), line: 0)
    
    private let thirddLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eventDescription = UILabel(text: "Школа Управление \n\nСпикер: Основатель бизнес клуба Терра- Расулов Шухрат \n\nНачало занятия: 01.05.2022 в 12:00 \n\nМесто: Мясницкая 13, строение 11 \n\nВход по заведомо заказанным пропускам!", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    private lazy var registerToEventButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(registerEventButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let periodRegistrationLabel = UILabel(text: "Период регистрации: 17 апр. 2022 - 1 мая 2022", font: .systemFont(ofSize: 12), textColor: #colorLiteral(red: 0.6470588235, green: 0.6470588235, blue: 0.6470588235, alpha: 1), line: 0)
    
    private var statusEventStackView = UIStackView()
    private var calendarStackView = UIStackView()
    private var meetingPointStackView = UIStackView()
    private var infoStackView = UIStackView()
    private var eventSpeackerStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        statusEventStackView = UIStackView(arrangedSubviews: [statusEventIcon,
                                                              statusEvent],
                                           axis: .horizontal,
                                           spacing: 15)
        calendarStackView = UIStackView(arrangedSubviews: [calendarIcon,
                                                           calendarDate],
                                        axis: .horizontal,
                                        spacing: 15)
        meetingPointStackView = UIStackView(arrangedSubviews: [meetingPointIcon,
                                                               meetingPointLabel],
                                            axis: .horizontal,
                                            spacing: 15)
        eventSpeackerStackView = UIStackView(arrangedSubviews: [speackerLabel,
                                                                nameSpeackerLabel,
                                                                descriptionSpeacker],
                                             axis: .vertical,
                                             spacing: 1)

        let backButton = UIBarButtonItem()
        backButton.title = "Календарь"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        view.addSubview(scrollView)
        scrollView.addSubview(eventName)
        scrollView.addSubview(firstLineView)
        scrollView.addSubview(statusEventStackView)
        scrollView.addSubview(calendarStackView)
        scrollView.addSubview(meetingPointStackView)
        scrollView.addSubview(secondLineView)
        scrollView.addSubview(speackerAvatar)
        scrollView.addSubview(eventSpeackerStackView)
        scrollView.addSubview(hashtagLabel)
        scrollView.addSubview(thirddLineView)
        scrollView.addSubview(eventDescription)
        scrollView.addSubview(registerToEventButton)
        scrollView.addSubview(periodRegistrationLabel)
    }
}

private func registerEventButton() {
    print("registred")
}

extension EventDescriptionViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            eventName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            eventName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            firstLineView.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 24),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            statusEventStackView.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 30),
            statusEventStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            calendarStackView.topAnchor.constraint(equalTo: statusEventStackView.bottomAnchor, constant: 30),
            calendarStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            meetingPointStackView.topAnchor.constraint(equalTo: calendarStackView.bottomAnchor, constant: 30),
            meetingPointStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: meetingPointStackView.bottomAnchor, constant: 30),
            secondLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            speackerAvatar.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 24),
            speackerAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            speackerAvatar.heightAnchor.constraint(equalToConstant: 50),
            speackerAvatar.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            eventSpeackerStackView.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 25),
            eventSpeackerStackView.leadingAnchor.constraint(equalTo: speackerAvatar.trailingAnchor, constant: 12)
        ])
        NSLayoutConstraint.activate([
            hashtagLabel.topAnchor.constraint(equalTo: speackerAvatar.bottomAnchor, constant: 24),
            hashtagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            thirddLineView.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 24),
            thirddLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirddLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirddLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            eventDescription.topAnchor.constraint(equalTo: thirddLineView.bottomAnchor, constant: 24),
            eventDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            registerToEventButton.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant: 30),
            registerToEventButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            registerToEventButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            registerToEventButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        NSLayoutConstraint.activate([
            periodRegistrationLabel.topAnchor.constraint(equalTo: registerToEventButton.bottomAnchor, constant: 9),
            periodRegistrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            periodRegistrationLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
}
