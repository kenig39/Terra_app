//
//  MyCompanyView.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 28.07.2022.
//

import UIKit
class MyCompanyView: UIView {
    
//    private let backView: UIView = {
//       let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    private let terraText = UILabel(text: "TERRA", font: .systemFont(ofSize: 14), textColor: .black, line: 1)
    private let aboutCompany = UILabel(text: "Сообщество предпринимателей", font: .systemFont(ofSize: 12), textColor: .white, line: 3)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(backView)
        addSubview(terraText)
        addSubview(aboutCompany)
        aboutCompany.textAlignment = .center
        aboutCompany.adjustsFontSizeToFitWidth = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            terraText.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            terraText.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            aboutCompany.topAnchor.constraint(equalTo: terraText.bottomAnchor, constant: 3),
            aboutCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            aboutCompany.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }
}
