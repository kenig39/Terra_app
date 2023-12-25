//
//  EventTodayView.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 01.08.2022.
//

import UIKit

protocol OpenEventVC: AnyObject {
    func openViewAboutEvent()
}

class EventTodayView: UIView {
    
    private let eventName = UILabel(text: "Школа управления", font: .systemFont(ofSize: 18), textColor: .black, line: 0)
    
    private let speackerAvatar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "speacker_avatar")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let speackerLabel = UILabel(text: "Спикер", font: .systemFont(ofSize: 12), textColor: #colorLiteral(red: 0.7061325908, green: 0.7061325908, blue: 0.7061325908, alpha: 1), line: 0)
    private let nameSpeackerLabel = UILabel(text: "Расулов Шухрат", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    private let descriptionSpeacker = UILabel(text: "Основатель TERRA", font: .systemFont(ofSize: 14), textColor: .black, line: 0)
    
    private let calendarIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "calendar_icon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let calendarDate = UILabel(text: "1 августа 2022, среда",
                                   font: .systemFont(ofSize: 14),
                                   textColor: .black,
                                   line: 0)
    private let hashtagLabel = UILabel(text: "#terraclub #школа_управления", font: .systemFont(ofSize: 11), textColor: #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1), line: 0)
    
    private lazy var registerToEvent: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
//        button.tintColor = .black
        button.setImage(UIImage(named: "register_event_btn"), for: .normal)
        button.addTarget(self, action: #selector(openViewAboutEvent), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var eventSpeackerStackView = UIStackView()
    private var calendarStackView = UIStackView()
    
    weak var openEventVC: OpenEventVC?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
        eventSpeackerStackView = UIStackView(arrangedSubviews: [speackerLabel, nameSpeackerLabel, descriptionSpeacker], axis: .vertical, spacing: 1)
        calendarStackView = UIStackView(arrangedSubviews: [calendarIcon, calendarDate], axis: .horizontal, spacing: 12)
        
        addSubview(eventName)
        addSubview(speackerAvatar)
        addSubview(eventSpeackerStackView)
        addSubview(calendarStackView)
        addSubview(hashtagLabel)
        addSubview(registerToEvent)
    }
    
    @objc private func openViewAboutEvent() {
//        let eventDescriptionViewController = EventDescriptionViewController()
//        eventDescriptionViewController.modalPresentationStyle = .formSheet
//        present(eventDescriptionViewController, animated: true)
        openEventVC?.openViewAboutEvent()
    }
    
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            eventName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            speackerAvatar.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 16),
            speackerAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            speackerAvatar.heightAnchor.constraint(equalToConstant: 50),
            speackerAvatar.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            eventSpeackerStackView.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 17),
            eventSpeackerStackView.leadingAnchor.constraint(equalTo: speackerAvatar.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            calendarStackView.topAnchor.constraint(equalTo: speackerAvatar.bottomAnchor, constant: 18),
            calendarStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hashtagLabel.topAnchor.constraint(equalTo: calendarStackView.bottomAnchor, constant: 12),
            hashtagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            registerToEvent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            registerToEvent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
