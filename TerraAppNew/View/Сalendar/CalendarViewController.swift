//
//  CalendarViewController.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 01.08.2022.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let calendarLabel = UILabel(text: "Календарь",
                                        font: .proDisplayBold18(),
                                        color: .black,
                                        line: 1)
    
    private let terraClubLabel = UILabel(text: "TerraClub", font: .proDisplay14(), textColor: .black, line: 1)
    
    private let terraLogo: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "terra_logo")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = #colorLiteral(red: 0.4026663258, green: 0.4040816754, blue: 0.4083277239, alpha: 1)
        textField.font = .systemFont(ofSize: 17)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Поиск"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "filter_button"), for: .normal)
        button.addTarget(self, action: #selector(filterButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.tintColor = .green
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calendarIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "calendar_icon")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let calendarDate = UILabel(text: "1 мая 2022, среда",
                                   font: .systemFont(ofSize: 14),
                                   textColor: .black,
                                   line: 0)
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eventTodayView = EventTodayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(calendarLabel)
        scrollView.addSubview(terraClubLabel)
        scrollView.addSubview(terraLogo)
        scrollView.addSubview(zeroLineView)
        scrollView.addSubview(searchTextField)
        scrollView.addSubview(filterButton)
        
        scrollView.addSubview(calendar)
        scrollView.addSubview(firstLineView)
        scrollView.addSubview(calendarIcon)
        scrollView.addSubview(calendarDate)
        scrollView.addSubview(secondLineView)
        scrollView.addSubview(eventTodayView)
        
        eventTodayView.openEventVC = self
    }
    
    @objc private func filterButtonTap() {
        print("filtred")
    }
    
}

extension CalendarViewController: OpenEventVC {
    func openViewAboutEvent() {
        let eventDescriptionViewController = EventDescriptionViewController()
        navigationController?.pushViewController(eventDescriptionViewController, animated: true)
        eventDescriptionViewController.modalPresentationStyle = .fullScreen
    }
}

extension CalendarViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        
       
            calendarLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            calendarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            terraClubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraClubLabel.centerYAnchor.constraint(equalTo: calendarLabel.centerYAnchor),
            terraClubLabel.leadingAnchor.constraint(equalTo: terraLogo.trailingAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            terraLogo.trailingAnchor.constraint(equalTo: terraClubLabel.leadingAnchor, constant: -6),
            terraLogo.heightAnchor.constraint(equalTo: terraLogo.widthAnchor, multiplier: 1),
            terraLogo.centerYAnchor.constraint(equalTo: terraClubLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            zeroLineView.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 12),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 16),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -16),
            searchTextField.heightAnchor.constraint(equalToConstant: 36)
        ])
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 18),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            calendar.heightAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            firstLineView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 16),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            calendarIcon.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 18),
            calendarIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            calendarDate.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 22),
            calendarDate.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 14)
        ])
        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: calendarIcon.bottomAnchor, constant: 20),
            secondLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            eventTodayView.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 16),
            eventTodayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventTodayView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            eventTodayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            eventTodayView.heightAnchor.constraint(equalToConstant: 207)
        ])
    }
}
