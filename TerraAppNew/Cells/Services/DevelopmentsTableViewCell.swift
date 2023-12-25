//
//  LableAndImageCellTableViewCell.swift
//  Terra
//
//  Created by Alexander on 29.07.2022.
//

import UIKit
import SnapKit

class DevelopmentsTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.30
        view.layer.shadowRadius = 5
        return view
    }()
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "calendar")
        return imageView
    }()
    
    var labelHeader = UILabel(font: .systemFont(ofSize: 18, weight: .bold), color: .black, line: 1)
    private var speakerLabel = UILabel(text: "Спикер",
                                       font: .systemFont(ofSize: 12, weight: .regular),
                                       color: .specialDarkGray,
                                       line: 1)
    var nameLabel = UILabel(font: .systemFont(ofSize: 14, weight: .bold),
                            color: .black,
                            line: 1)
    var founderLabel = UILabel(font: .systemFont(ofSize: 14, weight: .regular),
                               color: .black,
                               line: 1)
    var dateLabel = UILabel(font: .systemFont(ofSize: 14, weight: .regular),
                            color: .black,
                            line: 1)
    var hashtagLabel = UILabel(text: "#хештег #хештег",
                               font: .proDisplayRegular14(),
                               color: .specialBlue,
                               line: 0)
    
    //MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectionStyle = .none
        layer.masksToBounds = true
        //  applyShadow(cornerRadius: self.frame.width / 10)
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
    }
    
    override func prepareForReuse() {
        photoImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    func setupCell (_ model: SchoolEventModel) {
        
        photoImageView.image = model.speakerImage
        nameLabel.text = model.speakerName
        founderLabel.text = model.speakerPosition
        labelHeader.text = model.schoolName
        dateLabel.text = model.dateAndTimeOfEvent
        hashtagLabel.text = model.hashtagsInfo
    }
    
    //MARK: - SetupViews
    
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(labelHeader)
        containerView.addSubview(photoImageView)
        containerView.addSubview(speakerLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(founderLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(calendarImageView)
        containerView.addSubview(hashtagLabel)
    }
    
    //MARK: - SetConstraints
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelHeader.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            labelHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            labelHeader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: labelHeader.bottomAnchor, constant: 18),
            photoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 1/1)
        ])
        
        NSLayoutConstraint.activate([
            speakerLabel.topAnchor.constraint(equalTo: labelHeader.bottomAnchor, constant: 18),
            speakerLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: speakerLabel.bottomAnchor, constant: 1),
            nameLabel.leadingAnchor.constraint(equalTo: speakerLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            founderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            founderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            calendarImageView.topAnchor.constraint(equalTo: founderLabel.bottomAnchor, constant: 18),
            calendarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            calendarImageView.heightAnchor.constraint(equalToConstant: 24),
            calendarImageView.widthAnchor.constraint(equalTo: calendarImageView.heightAnchor, multiplier: 1/1)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            hashtagLabel.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 12),
            hashtagLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      //      hashtagLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
