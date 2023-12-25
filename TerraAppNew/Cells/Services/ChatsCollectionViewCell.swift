//
//  ChatsCollectionViewCell.swift
//  TerraAppNew
//
//  Created by gleba on 29.07.2022.
//

import UIKit

class ChatsCollectionViewCell: UICollectionViewCell {
        
    var chatsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return imageView
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel(text: " ",
                            font: .proDisplay14(),
                            color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                            line: 0)
        label.textAlignment = .center
        return label
    }()

    //MARK: - Override

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        applyShadow(cornerRadius: self.frame.width / 20)
    }

    override func prepareForReuse() {
        chatsImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setConstraints()
    }

    //MARK: - SetupViews

    private func setupViews() {

        backgroundColor = .white
        addSubview(chatsImageView)
        addSubview(descriptionLabel)
    }

    //MARK: - SetConstraints

    private func setConstraints() {

        NSLayoutConstraint.activate([
            chatsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            chatsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            chatsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            chatsImageView.heightAnchor.constraint(equalTo: chatsImageView.widthAnchor, multiplier: 152/169),
 
            descriptionLabel.topAnchor.constraint(equalTo: chatsImageView.bottomAnchor, constant: 17),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
