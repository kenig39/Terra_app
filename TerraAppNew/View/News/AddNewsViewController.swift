//
//  AddNewsViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//

import UIKit

class AddNewsViewController: UIViewController {
    
    private var terraValue: Int = -1
    private var businessValue: Int = -1
    private var otherValue: Int = -1
    private var downloadPicTapped: Int = -1
    private var deleteTapped: Int = -1
    
    private lazy var newsTitle: UILabel = {
       let newsTitle = UILabel(frame: CGRect(x: view.frame.width / 2 - 47, y: 75, width: 94, height: 21))
        newsTitle.text = "Добавить"
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
        enterNewsTitle.text = "Название новости"
        enterNewsTitle.textColor = Constants.Colors.mediumGray
        enterNewsTitle.font = Constants.Fonts.LargeTitle
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
        enterNewsDescription.text = "Общая идея"
        enterNewsDescription.textColor = Constants.Colors.mediumGray
        enterNewsDescription.font = Constants.Fonts.Regular18
        enterNewsDescription.textAlignment = .natural
        enterNewsDescription.keyboardType = UIKeyboardType.default
        enterNewsDescription.returnKeyType = UIReturnKeyType.done
        enterNewsDescription.layer.borderColor = Constants.Colors.lightGray?.cgColor
        enterNewsDescription.layer.borderWidth = 1
        enterNewsDescription.layer.cornerRadius = 10
        enterNewsDescription.contentInset = UIEdgeInsets(top: 14, left: 16, bottom: 0, right: 18)
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
        categoryButton.backgroundColor = .white
        categoryButton.layer.cornerRadius = 10
        categoryButton.layer.borderColor = Constants.Colors.blue?.cgColor
        return categoryButton
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
    
    private lazy var line2: UIImageView = {
        let line2 = UIImageView()
        let lineImage = UIImage(named: "line")
        line2.image = lineImage
        line2.translatesAutoresizingMaskIntoConstraints = false
        return line2
    }()
    
    private lazy var sendButton: UIButton = {
        let sendButton = UIButton()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setImage(Constants.Image.sendButton, for: .normal)
        sendButton.layer.cornerRadius = 10
     return sendButton
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
        view.addSubview(categoryLabel)
        view.addSubview(stackView)
        view.addSubview(downloadPic)
        view.addSubview(deleteButton)
        view.addSubview(line2)
        view.addSubview(sendButton)
        view.addSubview(checkBox)
        setupConstraints()
        
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
        
        deleteButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.deleteTapped += 1
                    self.didTapDeleteButton()
                }), for: .touchUpInside)
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
            case 1:
                self.downloadPic.backgroundColor = Constants.Colors.turquoise
                self.downloadPicTapped -= 2
            default:
                self.downloadPic.backgroundColor = Constants.Colors.turquoise
                self.downloadPicTapped = -1
            }
        }
    }
    
    @objc private func didTapDeleteButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.deleteTapped {
            case 0:
                self.deleteButton.backgroundColor = Constants.Colors.turquoise
            case 1:
                self.deleteButton.backgroundColor = Constants.Colors.lightGray
                self.deleteTapped -= 2
            default:
                self.deleteButton.backgroundColor = Constants.Colors.turquoise
                self.deleteTapped = -1
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
            customTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            customTitleLabel.widthAnchor.constraint(equalToConstant: 60),
            customTitleLabel.heightAnchor.constraint(equalToConstant: 12),
            
            enterNewsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            enterNewsTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
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
            enterNewsDescription.heightAnchor.constraint(equalToConstant: 200),
            
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            categoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            categoryLabel.widthAnchor.constraint(equalToConstant: 60),
            categoryLabel.heightAnchor.constraint(equalToConstant: 12),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
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
            
            downloadPic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            downloadPic.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            downloadPic.widthAnchor.constraint(equalToConstant: 226),
            downloadPic.heightAnchor.constraint(equalToConstant: 40),
            
            downloadImage.leadingAnchor.constraint(equalTo: downloadPic.leadingAnchor, constant: 11),
            downloadImage.topAnchor.constraint(equalTo: downloadPic.topAnchor, constant: 11),
            downloadImage.widthAnchor.constraint(equalToConstant: 20),
            downloadImage.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 255),
            deleteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
            
            line2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            line2.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            line2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            line2.heightAnchor.constraint(equalToConstant: 1),
            
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            sendButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 680),
            sendButton.widthAnchor.constraint(equalToConstant: 118),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            
            checkBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            checkBox.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            checkBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            checkBox.heightAnchor.constraint(equalToConstant: 80),
            
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
