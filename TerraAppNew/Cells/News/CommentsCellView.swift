//
//  CommentsCellView.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 08.08.2022.
//

import UIKit

class CommentsCellView: UITableViewCell {

// static let identifier = "CommentsTableViewCell"
    private let dateformatter = DateFormatter.dateFormatter()
    private let name: UILabel = {
        let name = UILabel()
        name.font = Constants.Fonts.SFProDisplay_Bold11
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private let comment: UILabel = {
        let comment = UILabel()
        comment.numberOfLines = 0
        comment.font = Constants.Fonts.Regular10
        comment.textAlignment = .natural
        comment.translatesAutoresizingMaskIntoConstraints = false
        return comment
    }()
    private let date: UILabel = {
        let date = UILabel()
        date.textAlignment = .left
        date.font = Constants.Fonts.Regular10
        date.textColor = .gray
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()

    private let avaImage: UIImageView = {
        let avaImage = UIImageView()
        avaImage.clipsToBounds = true
        avaImage.contentMode = .scaleAspectFill
        avaImage.translatesAutoresizingMaskIntoConstraints = false
        avaImage.layer.cornerRadius = 18.5
       return avaImage
    }()
   let heartImage: UIButton = {
        let heartImage = UIButton()
        heartImage.clipsToBounds = true
        heartImage.contentMode = .scaleAspectFill
        heartImage.translatesAutoresizingMaskIntoConstraints = false
       return heartImage
    }()
    let respondButton: UIButton = {
         let respondButton = UIButton()
        respondButton.clipsToBounds = true
        respondButton.contentMode = .scaleAspectFill
        respondButton.translatesAutoresizingMaskIntoConstraints = false
        respondButton.setTitle("Ответить", for: .normal)
        respondButton.titleLabel?.font = Constants.Fonts.Regular10
        respondButton.setTitleColor(Constants.Colors.gray, for: .normal)
        return respondButton
     }()
    private let whiteHeartImage: UIButton = {
        let whiteHeartImage = UIButton()
        whiteHeartImage.clipsToBounds = true
        whiteHeartImage.contentMode = .scaleAspectFill
        whiteHeartImage.layer.cornerRadius = 10
      //  let whiteHeart = UIImage(named: "whiteHeart")
        whiteHeartImage.backgroundColor = Constants.Colors.turquoise
      //  whiteHeartImage.image = whiteHeart
        whiteHeartImage.translatesAutoresizingMaskIntoConstraints = false
       return whiteHeartImage
    }()
    private let likesCountLabel: UILabel = {
       let likesCountLabel = UILabel()
        likesCountLabel.text = "8"
        likesCountLabel.font = Constants.Fonts.Regular10
        likesCountLabel.textColor = Constants.Colors.gray
        likesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesCountLabel
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(name)
        stackView.addSubview(comment)
        stackView.addSubview(avaImage)
      //  stackView.addSubview(heartImage)
        stackView.addSubview(date)
        stackView.addSubview(whiteHeartImage)
        stackView.addSubview(respondButton)
        stackView.addSubview(likesCountLabel)
        return stackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(stackView)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        comment.text = nil
        avaImage.image = nil
        date.text = nil
    }
    func configure(with viewModel: CommentsModel) {
        name.text = viewModel.name
        comment.text = viewModel.comment
        avaImage.image = viewModel.ava
     //   heartImage.setImage(Constants.Image.grayHeart, for: .normal)
        whiteHeartImage.setImage(Constants.Image.whiteHeart, for: .normal)
        likesCountLabel.text = "8"
        
          //      guard let publicationDate = viewModel.date else { return }
   //     guard let formattedPublicationDate = dateformatter.date(from: publicationDate) else { return }
    //    var dateForLabel: String {
     //       let dateFormatter = DateFormatter()
      //      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       //     return dateFormatter.string(from: formattedPublicationDate)
       // }
        date.text = viewModel.date
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 400),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            
            avaImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 3),
            avaImage.topAnchor.constraint(equalTo: stackView.topAnchor,constant: 2),
            avaImage.widthAnchor.constraint(equalToConstant: 37),
            avaImage.heightAnchor.constraint(equalToConstant: 37),
        
            name.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            name.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 3),
            name.widthAnchor.constraint(equalToConstant: 200),
            name.heightAnchor.constraint(equalToConstant: 9),
        
            comment.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            comment.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 1),
            comment.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -60),
            comment.heightAnchor.constraint(equalToConstant: 24),
            
            date.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            date.widthAnchor.constraint(equalToConstant: 200),
            date.topAnchor.constraint(equalTo: comment.bottomAnchor, constant: 2),
            date.heightAnchor.constraint(equalToConstant: 8),
            
 //           heartImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
   //         heartImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: stackView.frame.height / 2 + 3),
     //       heartImage.widthAnchor.constraint(equalToConstant: 20),
       //     heartImage.heightAnchor.constraint(equalToConstant: 20),
 
            whiteHeartImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -33),
            whiteHeartImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: stackView.frame.height / 2 + 3),
            whiteHeartImage.widthAnchor.constraint(equalToConstant: 20),
            whiteHeartImage.heightAnchor.constraint(equalToConstant: 20),
            
            likesCountLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -23),
            likesCountLabel.topAnchor.constraint(equalTo: whiteHeartImage.topAnchor),
            likesCountLabel.widthAnchor.constraint(equalToConstant: 5),
            likesCountLabel.heightAnchor.constraint(equalToConstant: 15),
            
            respondButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15),
            respondButton.widthAnchor.constraint(equalToConstant: 100),
            respondButton.topAnchor.constraint(equalTo: whiteHeartImage.bottomAnchor, constant: 4),
            respondButton.heightAnchor.constraint(equalToConstant: 8),
        
       ])
}
}
