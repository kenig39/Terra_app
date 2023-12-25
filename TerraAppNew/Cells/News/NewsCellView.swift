//
//  NewsCellView.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//

import UIKit

class NewsCellView: UITableViewCell {
    
    var likesCount: Int = 8596
   
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .proDisplayBold16()
        nameLabel.text = "Иван Иванов"
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = RegularLabelModel()
        emailLabel.text = "ivan@yandex.ru"
        emailLabel.font = .proDisplay14()
        return emailLabel
    }()
    
    private lazy var dateLabel: UILabel = {
       let dateLabel = RegularLabelModel()
        dateLabel.text = "27 июня"
        emailLabel.font = .proDisplay14()
        return dateLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = .proDisplay14()
        textLabel.textAlignment = .left
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 6
        textLabel.text = "Резидент бизнес-клуба Terra рассказывает \nо 6 инструментах маркетинга, которые позволят вырасти тебе в бизнесе в 2-3 раза быстрее. \n \nСмотри видео до конца, делай свой бизнес..."
        return textLabel
    }()
    
    private lazy var hashtagLabel: UILabel = {
        let label = BlueLabelModel()
        label.text = "#terraclub #маркетинг #наставники"
        label.isHidden = true
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let likeLabel = GrayLabelModel()
        likeLabel.text = "8596"
        return likeLabel
    }()
    private lazy var dislikeLabel: UILabel = {
        let dislikeLabel = GrayLabelModel()
        dislikeLabel.text = "0"
        return dislikeLabel
    }()
    
    private lazy var commentsLabel: UILabel = {
        let commentsLabel = GrayLabelModel()
        commentsLabel.text = "23"
        
        commentsLabel.isHidden = true
        return commentsLabel
    }()
    
    private lazy var likeButton: UIButton = {
       let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(Constants.Image.likeButton, for: .normal)
        return likeButton
    }()
    
    private lazy var dislikeButton: UIButton = {
       let dislikeButton = UIButton()
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.setImage(Constants.Image.dislikeButton, for: .normal)
        return dislikeButton
    }()
    
    private lazy var commentButton: UIButton = {
        let commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setImage(Constants.Image.commentButton, for: .normal)
        
        commentButton.isHidden = true
        return commentButton
    }()
    
    private lazy var favoritesButton: UIButton = {
       let favoritesButton = UIButton()
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
      
        favoritesButton.isHidden = true
        return favoritesButton
    }()
    
    private lazy var alertButton: UIButton = {
       let alertButton = UIButton()
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.setImage(Constants.Image.dotsButton, for: .normal)
        
        alertButton.isHidden = true
        return alertButton
    }()
    
    private lazy var avatar: UIImageView = {
       let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.image = UIImage(named: "avatar")
        return avatar
    }()
    private lazy var mainImage: UIImageView = {
       let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.image = UIImage(named: "newsImage")
        return mainImage
    }()
    lazy var container: UIStackView = {
        let container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(shadow)
        return container
    }()
   private lazy var shadow: UIStackView = {
       let shadow = UIStackView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.applyShadow(cornerRadius: 5)
        shadow.addSubview(newsCell)
        return shadow
    }()
    private lazy var newsCell: UIStackView = {
       let newsCell = UIStackView()
        newsCell.layer.backgroundColor = UIColor.white.cgColor
        newsCell.layer.cornerRadius = 20
        newsCell.translatesAutoresizingMaskIntoConstraints = false
        newsCell.addSubview(nameLabel)
        newsCell.addSubview(emailLabel)
        newsCell.addSubview(dateLabel)
        newsCell.addSubview(descriptionLabel)
        newsCell.addSubview(hashtagLabel)
        newsCell.addSubview(likeLabel)
        newsCell.addSubview(dislikeLabel)
        newsCell.addSubview(commentsLabel)
        newsCell.addSubview(likeButton)
        newsCell.addSubview(dislikeButton)
        newsCell.addSubview(commentButton)
        newsCell.addSubview(favoritesButton)
        newsCell.addSubview(alertButton)
        newsCell.addSubview(avatar)
        newsCell.addSubview(mainImage)
        return newsCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)
        setupConstraints()
        likeButton.addTarget(self,
                            action: #selector(didTapLikeButton),
                           for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure (_ viewModel: NewsModel) {
        container = viewModel.news
    }
    @objc private func didTapLikeButton() {
        likesCount += 1
        let newText = String(likesCount)
        likeLabel.text = newText
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            shadow.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            shadow.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            shadow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            shadow.heightAnchor.constraint(equalToConstant: 452),
            
            newsCell.leadingAnchor.constraint(equalTo: shadow.leadingAnchor),
            newsCell.topAnchor.constraint(equalTo: shadow.topAnchor),
            newsCell.trailingAnchor.constraint(equalTo: shadow.trailingAnchor),
            newsCell.bottomAnchor.constraint(equalTo: shadow.bottomAnchor),
            
            avatar.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 15),
            avatar.topAnchor.constraint(equalTo: newsCell.topAnchor, constant: 14),
            avatar.widthAnchor.constraint(equalToConstant: 55),
            avatar.heightAnchor.constraint(equalToConstant: 55),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: avatar.centerYAnchor),
           // nameLabel.topAnchor.constraint(equalTo: newsCell.topAnchor, constant: 13),
            nameLabel.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -10),
           // nameLabel.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -390),
            
            emailLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            emailLabel.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -10),
           // emailLabel.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -379),
            
            //dateLabel.topAnchor.constraint(equalTo: newsCell.topAnchor, constant: 29),
            dateLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -21),
           // dateLabel.widthAnchor.constraint(equalToConstant: 40),
           // dateLabel.heightAnchor.constraint(equalToConstant: 13),
            
            alertButton.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -16),
            alertButton.topAnchor.constraint(equalTo: newsCell.topAnchor, constant: 16),
            alertButton.widthAnchor.constraint(equalToConstant: 16),
            alertButton.heightAnchor.constraint(equalToConstant: 4),
            
            mainImage.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 16),
            mainImage.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            mainImage.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -16),
            mainImage.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -175),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: likeButton.topAnchor, constant: -16),
            
            hashtagLabel.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 15),
            hashtagLabel.topAnchor.constraint(equalTo: newsCell.topAnchor, constant: 353),
            hashtagLabel.widthAnchor.constraint(equalToConstant: 327),
            hashtagLabel.heightAnchor.constraint(equalToConstant: 78),
            
            likeButton.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 16),
            likeButton.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -18.08),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            
            likeLabel.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 43),
            likeLabel.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -9),
            likeLabel.widthAnchor.constraint(equalToConstant: 27),
            likeLabel.heightAnchor.constraint(equalToConstant: 41),
            
            dislikeButton.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 85),
            dislikeButton.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -18.08),
            dislikeButton.widthAnchor.constraint(equalToConstant: 20),
            dislikeButton.heightAnchor.constraint(equalToConstant: 20),
            
            dislikeLabel.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 114),
            dislikeLabel.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -9),
            dislikeLabel.widthAnchor.constraint(equalToConstant: 15),
            dislikeLabel.heightAnchor.constraint(equalToConstant: 41),
            
            commentButton.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 134),
            commentButton.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -17.54),
            commentButton.widthAnchor.constraint(equalToConstant: 21),
            commentButton.heightAnchor.constraint(equalToConstant: 21),
            
            commentsLabel.leadingAnchor.constraint(equalTo: newsCell.leadingAnchor, constant: 163),
            commentsLabel.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -9),
            commentsLabel.widthAnchor.constraint(equalToConstant: 15),
            commentsLabel.heightAnchor.constraint(equalToConstant: 41),
            
            favoritesButton.trailingAnchor.constraint(equalTo: newsCell.trailingAnchor, constant: -15),
            favoritesButton.bottomAnchor.constraint(equalTo: newsCell.bottomAnchor, constant: -17),
            favoritesButton.widthAnchor.constraint(equalToConstant: 13.16),
            favoritesButton.heightAnchor.constraint(equalToConstant: 20.95)
        ])
}
}

