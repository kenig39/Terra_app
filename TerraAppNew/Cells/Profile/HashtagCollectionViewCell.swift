//
//  HashtagCollectionViewCell.swift
//  TerraAppNew
//
//  Created by Natali on 18.08.2022.
//

import Foundation

import UIKit

class HashtagCollectionViewCell: UICollectionViewCell {

    private let hashtagLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.backgroundColor = .specialBlue
       // label.layer.cornerRadius = 13
                label.textAlignment = .center
        label.font = .proDisplay12()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let xMarkImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .specialGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - Override

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        layer.cornerRadius = 13
        backgroundColor = .specialBlue

        addSubview(hashtagLabel)
        addSubview(xMarkImageView)
            }

    func cellConfigure(model: HashtagModel) {

        hashtagLabel.text = model.nameOfHashtag
        xMarkImageView.image = model.imageOfXMark
    }

    private func setConstraints() {

        NSLayoutConstraint.activate([
            hashtagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            hashtagLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        //    hashtagLabel.widthAnchor.constraint(equalToConstant: 40)
            hashtagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
          //  xMarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            xMarkImageView.leadingAnchor.constraint(equalTo: hashtagLabel.trailingAnchor, constant: 8),
            xMarkImageView.centerYAnchor.constraint(equalTo: hashtagLabel.centerYAnchor),
            xMarkImageView.heightAnchor.constraint(equalToConstant: 16),
            xMarkImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
}
