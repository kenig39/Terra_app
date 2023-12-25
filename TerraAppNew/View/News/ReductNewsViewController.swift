//
//  ReductNewsViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//

import UIKit

class ReductNewsViewController: UIViewController {
    
    private var terraValue: Int = -1
    private var businessValue: Int = -1
    private var otherValue: Int = -1
    private var deleteButtonTapped: Int = -1
    private var downloadPicTapped: Int = -1
    
    private lazy var newsTitle: UILabel = {
        let newsTitle = UILabel(frame: CGRect(x: view.frame.width / 2 - 73, y: 75, width: 146, height: 21))
        newsTitle.text = "Редактировать"
        newsTitle.font = Constants.Fonts.BoldTitle
        newsTitle.textColor = Constants.Colors.gray
        return newsTitle
    }()
    private lazy var mainTitle: UILabel = {
       let mainTitle = UILabel()
        mainTitle.font = Constants.Fonts.LargeTitle
        mainTitle.textAlignment = .left
        mainTitle.text = "Что у вас нового?"
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        return mainTitle
    }()
    private lazy var customTitleLabel: UILabel = {
       let customTitleLabel = GrayLabelModel()
        customTitleLabel.text = "Заголовок"
        return customTitleLabel
    }()
    private lazy var enterNewsTitle: UITextField = {
        let enterNewsTitle = UITextField()
        enterNewsTitle.translatesAutoresizingMaskIntoConstraints = false
        enterNewsTitle.text = "Бери и делай с TerraClub"
        enterNewsTitle.font = Constants.Fonts.BoldTitle
        enterNewsTitle.borderStyle = UITextField.BorderStyle.none
        enterNewsTitle.keyboardType = UIKeyboardType.default
        enterNewsTitle.returnKeyType = UIReturnKeyType.done
        enterNewsTitle.clearButtonMode = UITextField.ViewMode.whileEditing
        enterNewsTitle.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return enterNewsTitle
    }()
    private lazy var customDescriptionLabel: UILabel = {
       let customDescriptionLabel = GrayLabelModel()
        customDescriptionLabel.text = "Описание"
        return customDescriptionLabel
    }()
    private lazy var enterNewsDescription: UITextView = {
        let enterNewsDescription = UITextView()
        enterNewsDescription.translatesAutoresizingMaskIntoConstraints = false
        enterNewsDescription.text = "Ученица бесплатного наставничества \n — Олеся Савчишкина из города Лю- \n берцы пришла в Terra на 20 поток с же- \n ланием расти в новом деле!"
        enterNewsDescription.autocapitalizationType = .words
        enterNewsDescription.font = Constants.Fonts.Regular18
        enterNewsDescription.textAlignment = .natural
        enterNewsDescription.keyboardType = UIKeyboardType.default
        enterNewsDescription.layer.borderColor = Constants.Colors.lightGray?.cgColor
        enterNewsDescription.layer.borderWidth = 1
        enterNewsDescription.layer.cornerRadius = 10
        enterNewsDescription.contentInset = UIEdgeInsets(top: 9, left: 12, bottom: 0, right: 12)
        return enterNewsDescription
    }()
    private lazy var line: UIImageView = {
        let line = UIImageView()
        let lineImage = UIImage(named: "line")
        line.image = lineImage
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    private lazy var categoryLabel: UILabel = {
       let categoryLabel = GrayLabelModel()
        categoryLabel.text = "Категория"
        return categoryLabel
    }()
    private lazy var categoryCheckBox: UILabel = {
       let categoryCheckBox = GrayLabelModel()
        categoryCheckBox.text = "Выбрать"
        return categoryCheckBox
    }()
    private var cornerImage: UIImageView = {
        let cornerImage = UIImageView()
        cornerImage.translatesAutoresizingMaskIntoConstraints = false
        cornerImage.image = Constants.Image.downButton
        return cornerImage
    }()
    private let categoryButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.layer.borderWidth = 2
        categoryButton.layer.cornerRadius = 10
        categoryButton.layer.borderColor = Constants.Colors.blue?.cgColor
        return categoryButton
    }()
    private lazy var checkBox: UIStackView = {
       let checkBox = UIStackView()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.layer.cornerRadius = 10
        checkBox.layer.borderWidth = 2
        checkBox.layer.cornerRadius = 10
        checkBox.layer.borderColor = Constants.Colors.blue?.cgColor
        checkBox.backgroundColor = .white
        checkBox.alpha = 0
        checkBox.addSubview(upButton)
        checkBox.addSubview(terraButton)
        checkBox.addSubview(businessButton)
        checkBox.addSubview(otherButton)
        checkBox.addSubview(checkBoxTitle)
        return checkBox
    }()
    private lazy var upButton: UIButton = {
        let upButton = UIButton()
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.setImage(Constants.Image.upButton, for: .normal)
        return upButton
    }()
    private lazy var checkBoxTitle: UILabel = {
       let categoryCheckBox = GrayLabelModel()
        categoryCheckBox.text = "Выбрать"
        return categoryCheckBox
    }()
    private lazy var terraButton: UIButton = {
       let terraButton = CheckBoxButtonModel()
        terraButton.setTitle("TerraClub", for: .normal)
        terraButton.backgroundColor = Constants.Colors.blue
        return terraButton
    }()
    private lazy var businessButton: UIButton = {
       let businesButton = CheckBoxButtonModel()
        businesButton.setTitle("Бизнес", for: .normal)
        businesButton.backgroundColor = Constants.Colors.gray
        return businesButton
    }()
    private lazy var otherButton: UIButton = {
       let otherButton = CheckBoxButtonModel()
        otherButton.setTitle("Другое", for: .normal)
        otherButton.backgroundColor = Constants.Colors.gray
        return otherButton
    }()
    private var downloadImage: UIImageView = {
        let downloadImage = UIImageView()
        downloadImage.translatesAutoresizingMaskIntoConstraints = false
        downloadImage.image = Constants.Image.downloadPic
        return downloadImage
    }()
    private lazy var downloadPic: UIButton = {
        let dowloadPic = UIButton()
        dowloadPic.backgroundColor = Constants.Colors.turquoise
        dowloadPic.translatesAutoresizingMaskIntoConstraints = false
        dowloadPic.layer.cornerRadius = 10
        dowloadPic.setTitle("  Загрузить изображение", for: .normal)
        dowloadPic.titleLabel?.font = Constants.Fonts.Regular
        dowloadPic.titleLabel?.textAlignment = .right
        dowloadPic.titleLabel?.textColor = .white
        dowloadPic.addSubview(downloadImage)
        return dowloadPic
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(categoryButton)
        stackView.addSubview(categoryCheckBox)
        stackView.addSubview(cornerImage)
        return stackView
    }()
    private lazy var deleteButton: UIButton = {
       let deleteButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.titleLabel?.font = Constants.Fonts.Regular
        deleteButton.layer.cornerRadius = 10
        deleteButton.backgroundColor = Constants.Colors.lightGray
        return deleteButton
    }()
    private lazy var uploadImage1: UIButton = {
       let uploadImage1 = UIButton()
        uploadImage1.translatesAutoresizingMaskIntoConstraints = false
        uploadImage1.setImage(Constants.Image.reductPhoto1, for: .normal)
        uploadImage1.addSubview(trashStackView1)
        return uploadImage1
    }()
    private lazy var uploadImage2: UIButton = {
       let uploadImage2 = UIButton()
        uploadImage2.translatesAutoresizingMaskIntoConstraints = false
        uploadImage2.setImage(Constants.Image.reductPhoto2, for: .normal)
        uploadImage2.addSubview(trashStackView2)
        return uploadImage2
    }()
    private lazy var uploadImage3: UIButton = {
       let uploadImage3 = UIButton()
        uploadImage3.translatesAutoresizingMaskIntoConstraints = false
        uploadImage3.setImage(Constants.Image.reductPhoto3, for: .normal)
        uploadImage3.addSubview(trashStackView3)
        return uploadImage3
    }()
    private lazy var changeButton: UIButton = {
        let changeButton = UIButton()
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.setImage(Constants.Image.changeButton, for: .normal)
        changeButton.layer.cornerRadius = 10
     return changeButton
    }()
    private lazy var line2: UIImageView = {
        let line2 = UIImageView()
        let lineImage = UIImage(named: "line")
        line2.image = lineImage
        line2.translatesAutoresizingMaskIntoConstraints = false
        return line2
    }()
    private lazy var trashStackView1: UIStackView = {
        let trashStackView1 = UIStackView(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashStackView1.addSubview(trashBackground1)
        trashStackView1.addSubview(trash1)
        trashStackView1.alpha = 0
        return trashStackView1
    }()
    private lazy var trashStackView2: UIStackView = {
        let trashStackView2 = UIStackView(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashStackView2.addSubview(trashBackground2)
        trashStackView2.addSubview(trash2)
        trashStackView2.alpha = 0
        return trashStackView2
    }()
    private lazy var trashStackView3: UIStackView = {
        let trashStackView3 = UIStackView(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashStackView3.addSubview(trashBackground3)
        trashStackView3.addSubview(trash3)
        trashStackView3.alpha = 0
        return trashStackView3
    }()
    private let trashBackground1: UIButton = {
       let trashBackground1 = UIButton(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashBackground1.setImage(Constants.Image.trashSquare, for: .normal)
        return trashBackground1
    }()
    private lazy var trash1: UIButton = {
       let trash1 = UIButton(frame: CGRect(x: 43, y: 42, width: 19, height: 22))
        trash1.setImage(Constants.Image.trash, for: .normal)
        return trash1
    }()
    private let trashBackground2: UIButton = {
       let trashBackground2 = UIButton(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashBackground2.setImage(Constants.Image.trashSquare, for: .normal)
        return trashBackground2
    }()
    private lazy var trash2: UIButton = {
       let trash2 = UIButton(frame: CGRect(x: 43, y: 42, width: 19, height: 22))
        trash2.setImage(Constants.Image.trash, for: .normal)
        return trash2
    }()
    private let trashBackground3: UIButton = {
       let trashBackground3 = UIButton(frame: CGRect(x: 0, y: 0, width: 108, height: 108))
        trashBackground3.setImage(Constants.Image.trashSquare, for: .normal)
        return trashBackground3
    }()
    private lazy var trash3: UIButton = {
       let trash3 = UIButton(frame: CGRect(x: 43, y: 42, width: 19, height: 22))
        trash3.setImage(Constants.Image.trash, for: .normal)
        return trash3
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(newsTitle)
        view.addSubview(mainTitle)
        view.addSubview(customTitleLabel)
        view.addSubview(enterNewsTitle)
        view.addSubview(line)
        view.addSubview(customDescriptionLabel)
        view.addSubview(enterNewsDescription)
        view.addSubview(customDescriptionLabel)
        view.addSubview(enterNewsDescription)
        view.addSubview(categoryLabel)
        view.addSubview(stackView)
        view.addSubview(downloadPic)
        view.addSubview(deleteButton)
        view.addSubview(uploadImage1)
        view.addSubview(uploadImage2)
        view.addSubview(uploadImage3)
        view.addSubview(line2)
        view.addSubview(changeButton)
        view.addSubview(checkBox)
        deleteButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.deleteButtonTapped += 1
                    self.didTapDeleteButton()
                }), for: .touchUpInside)
        trashBackground1.addTarget(self,
                            action: #selector(didTapFirstPhoto),
                           for: .touchUpInside)
        trashBackground2.addTarget(self,
                            action: #selector(didTapSecondPhoto),
                           for: .touchUpInside)
        trashBackground3.addTarget(self,
                            action: #selector(didTapThirdPhoto),
                           for: .touchUpInside)
        categoryButton.addTarget(self,
                         action: #selector(didTapCategoryButton),
                         for: .touchUpInside)
        upButton.addTarget(self,
                         action: #selector(didTapUpButton),
                         for: .touchUpInside)
        terraButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.terraValue += 1
                    self.didTapTerraButton()
                }), for: .touchUpInside)
        businessButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.businessValue += 1
                    self.didTapBusinessButton()
                }), for: .touchUpInside)
        otherButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.otherValue += 1
                    self.didTapOtherButton()
                }), for: .touchUpInside)
        downloadPic.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.downloadPicTapped += 1
                    self.didTapDownloadButton()
                }), for: .touchUpInside)
        setupConstraints()
    }
    @objc private func didTapDeleteButton() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            
            switch self.deleteButtonTapped {
            case 0:
                self.deleteButton.backgroundColor = Constants.Colors.turquoise
                self.trashStackView1.alpha = 1
                self.trashStackView2.alpha = 1
                self.trashStackView3.alpha = 1
            case 1:
                self.deleteButton.backgroundColor = Constants.Colors.lightGray
                self.trashStackView1.alpha = 0
                self.trashStackView2.alpha = 0
                self.trashStackView3.alpha = 0
                self.deleteButtonTapped -= 2
            default:
                self.deleteButton.backgroundColor = Constants.Colors.lightGray
                self.trashStackView1.alpha = 0
                self.trashStackView2.alpha = 0
                self.trashStackView3.alpha = 0
                self.deleteButtonTapped = -1
            }
        }
    }
    @objc private func didTapFirstPhoto() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
                self.uploadImage1.alpha = 0
                self.trashStackView1.alpha = 0
                self.uploadImage2.transform = CGAffineTransform(translationX: -128, y: 0)
            if self.trashStackView2.alpha == 1 {
                self.uploadImage3.transform = CGAffineTransform(translationX: -128, y: 0)
            } else if self.trashStackView2.alpha == 0 {
                self.uploadImage3.transform = CGAffineTransform(translationX: -256, y: 0)
        }
        }
    }
    @objc private func didTapSecondPhoto() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
                self.uploadImage2.alpha = 0
                self.trashStackView2.alpha = 0
            if self.trashStackView1.alpha == 1 {
                self.uploadImage3.transform = CGAffineTransform(translationX: -128, y: 0)
            } else if self.trashStackView1.alpha == 0 {
                self.uploadImage3.transform = CGAffineTransform(translationX: -256, y: 0)
        }
        }
    }
    @objc private func didTapThirdPhoto() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
                self.uploadImage3.alpha = 0
                self.trashStackView3.alpha = 0
        }
    }
    @objc private func didTapCategoryButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
                self.checkBox.alpha = 1
        }
    }
    @objc private func didTapUpButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
                self.checkBox.alpha = 0
        }
    }
    @objc private func didTapTerraButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            
            switch self.terraValue {
            case 0:
                self.terraButton.backgroundColor = Constants.Colors.gray
            case 1:
                self.terraButton.backgroundColor = Constants.Colors.blue
                self.terraValue -= 2
            default:
                self.terraButton.backgroundColor = Constants.Colors.gray
                self.terraValue = -1
            }
        }
    }
    @objc private func didTapBusinessButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            
            switch self.businessValue {
            case 0:
                self.businessButton.backgroundColor = Constants.Colors.blue
            case 1:
                self.businessButton.backgroundColor = Constants.Colors.gray
                self.businessValue -= 2
            default:
                self.businessButton.backgroundColor = Constants.Colors.blue
                self.businessValue = -1
            }
        }
    }
    @objc private func didTapOtherButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.otherValue {
            case 0:
                self.otherButton.backgroundColor = Constants.Colors.blue
            case 1:
                self.otherButton.backgroundColor = Constants.Colors.gray
                self.otherValue -= 2
            default:
                self.otherButton.backgroundColor = Constants.Colors.blue
                self.otherValue = -1
            }
        }
    }
    @objc private func didTapDownloadButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.downloadPicTapped {
            case 0:
                self.downloadPic.backgroundColor = Constants.Colors.lightGray
                let vc = UIImagePickerController()
                vc.sourceType = .photoLibrary
                vc.delegate = self
                vc.allowsEditing = true
                self.present(vc, animated: true)
            case 1:
                self.downloadPic.backgroundColor = Constants.Colors.turquoise
                self.downloadPicTapped -= 2
            default:
                self.downloadPic.backgroundColor = Constants.Colors.turquoise
                self.downloadPicTapped = -1
            }
        }
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            mainTitle.widthAnchor.constraint(equalToConstant: 250),
            mainTitle.heightAnchor.constraint(equalToConstant: 80),
            
            customTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            customTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 205),
            customTitleLabel.widthAnchor.constraint(equalToConstant: 60),
            customTitleLabel.heightAnchor.constraint(equalToConstant: 12),
            
            enterNewsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            enterNewsTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 235),
            enterNewsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            enterNewsTitle.heightAnchor.constraint(equalToConstant: 30),
            
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            line.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            customDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            customDescriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 290),
            customDescriptionLabel.widthAnchor.constraint(equalToConstant: 60),
            customDescriptionLabel.heightAnchor.constraint(equalToConstant: 12),
            
            enterNewsDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            enterNewsDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 310),
            enterNewsDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            enterNewsDescription.heightAnchor.constraint(equalToConstant: 122),
            
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            categoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            categoryLabel.widthAnchor.constraint(equalToConstant: 60),
            categoryLabel.heightAnchor.constraint(equalToConstant: 12),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 460),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            
            categoryButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            categoryButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            categoryButton.heightAnchor.constraint(equalToConstant: 40),
            
            cornerImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -17),
            cornerImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 15),
            cornerImage.widthAnchor.constraint(equalToConstant: 15),
            cornerImage.heightAnchor.constraint(equalToConstant: 10),
            
            categoryCheckBox.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 17),
            categoryCheckBox.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 15),
            categoryCheckBox.widthAnchor.constraint(equalToConstant: 60),
            categoryCheckBox.heightAnchor.constraint(equalToConstant: 12),
            
            checkBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            checkBox.topAnchor.constraint(equalTo: view.topAnchor, constant: 460),
            checkBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            checkBox.heightAnchor.constraint(equalToConstant: 80),
            
            downloadPic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            downloadPic.topAnchor.constraint(equalTo: view.topAnchor, constant: 515),
            downloadPic.widthAnchor.constraint(equalToConstant: 226),
            downloadPic.heightAnchor.constraint(equalToConstant: 40),
            
            downloadImage.leadingAnchor.constraint(equalTo: downloadPic.leadingAnchor, constant: 17),
            downloadImage.topAnchor.constraint(equalTo: downloadPic.topAnchor, constant: 11),
            downloadImage.widthAnchor.constraint(equalToConstant: 20),
            downloadImage.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 255),
            deleteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 515),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
            
            uploadImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            uploadImage1.topAnchor.constraint(equalTo: view.topAnchor, constant: 570),
            uploadImage1.widthAnchor.constraint(equalToConstant: 108),
            uploadImage1.heightAnchor.constraint(equalToConstant: 108),
            
            uploadImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128 + ((view.frame.width - 364) / 2)),
            uploadImage2.topAnchor.constraint(equalTo: view.topAnchor, constant: 570),
            uploadImage2.widthAnchor.constraint(equalToConstant: 108),
            uploadImage2.heightAnchor.constraint(equalToConstant: 108),
            
            uploadImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            uploadImage3.topAnchor.constraint(equalTo: view.topAnchor, constant: 570),
            uploadImage3.widthAnchor.constraint(equalToConstant: 108),
            uploadImage3.heightAnchor.constraint(equalToConstant: 108),
            
            line2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            line2.topAnchor.constraint(equalTo: view.topAnchor, constant: 688),
            line2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            line2.heightAnchor.constraint(equalToConstant: 1),
            
            changeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            changeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 708),
            changeButton.widthAnchor.constraint(equalToConstant: 118),
            changeButton.heightAnchor.constraint(equalToConstant: 40),
            
            upButton.trailingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: -20),
            upButton.topAnchor.constraint(equalTo: checkBox.topAnchor, constant: 15),
            upButton.widthAnchor.constraint(equalToConstant: 17),
            upButton.heightAnchor.constraint(equalToConstant: 13),
            
            terraButton.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 14),
            terraButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -10),
            terraButton.widthAnchor.constraint(equalToConstant: 69),
            terraButton.heightAnchor.constraint(equalToConstant: 26),
            
            businessButton.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 90),
            businessButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -10),
            businessButton.widthAnchor.constraint(equalToConstant: 69),
            businessButton.heightAnchor.constraint(equalToConstant: 26),
            
            otherButton.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 170),
            otherButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -10),
            otherButton.widthAnchor.constraint(equalToConstant: 69),
            otherButton.heightAnchor.constraint(equalToConstant: 26),
            
            checkBoxTitle.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 17),
            checkBoxTitle.topAnchor.constraint(equalTo: checkBox.topAnchor, constant: 15),
            checkBoxTitle.widthAnchor.constraint(equalToConstant: 60),
            checkBoxTitle.heightAnchor.constraint(equalToConstant: 12)
            ])
    }
}
extension ReductNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true,completion: nil)
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            if uploadImage1.alpha == 0 {
            uploadImage2.setImage(image, for: .normal)
            } else if uploadImage1.alpha == 0 && uploadImage2.alpha == 0 {
                uploadImage3.setImage(image, for: .normal)
            } else if uploadImage1.alpha == 0 && uploadImage2.alpha == 0 && uploadImage3.alpha == 0 {
                uploadImage1.alpha = 1
                uploadImage1.setImage(image, for: .normal)
            } else {
                uploadImage1.setImage(image, for: .normal)
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
}

