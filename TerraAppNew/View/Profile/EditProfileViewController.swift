//
//  EditProfileViewController.swift
//  TerraAppNew
//
//  Created by Natali on 28.07.2022.
//

import UIKit

class EditProfileViewController: UIViewController, UIScrollViewDelegate  {

    private var changeProfileLabel = UILabel(text: "Изменить профиль", font: .sfProDisplayBold24(), textColor: .black)

    private var changeDataLabel = UILabel(text: "Изменить данные", font: .sfProDisplayBold18(), textColor: .black)

    private var insightsFirstValue: Int = -1
    private var terraDobroFirstValue: Int = -1
    private var insightsSecondValue: Int = -1
    private var terraDobroSecondValue: Int = -1
    private var insightsThirdValue: Int = -1


    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()

    private let editNameLabel = UILabel(text: "Имя", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))
    
    private let editNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .alphabet
        return textField
    }()

    private let nameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editLastNameLabel = UILabel(text: "Фамилия", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editLastNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.keyboardType = .alphabet
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let lastNameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editNickLabel = UILabel(text: "Никнейм", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editNickTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let nickLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editHashtagLabel = UILabel(text: "Хэштеги", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private lazy var hashtagCheckBoxLabel: UILabel = {
        let categoryCheckBox = GrayLabelModel()
        categoryCheckBox.text = "Выбрать"
        return categoryCheckBox
    }()

    private let hashtagButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.layer.borderWidth = 2
        categoryButton.backgroundColor = .white
        categoryButton.layer.cornerRadius = 10
        categoryButton.layer.borderColor = UIColor.specialBlue.cgColor
        return categoryButton
    }()

    private var cornerImage: UIImageView = {
        let cornerImage = UIImageView()
        cornerImage.translatesAutoresizingMaskIntoConstraints = false
        cornerImage.image = Constants.Image.downButton
        return cornerImage
    }()

    private lazy var hashtagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(hashtagButton)
        stackView.addSubview(hashtagCheckBoxLabel)
        stackView.addSubview(cornerImage)
        return stackView
    }()
    
    private var titlesStackView = UIStackView()
    private var editNameStackView = UIStackView()
    private var editLastNameStackView = UIStackView()
    private var editNickStackView = UIStackView()
    private var generalStackViewFirst = UIStackView()

    private lazy var checkBox: UIStackView = {
        let checkBox = UIStackView()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.layer.cornerRadius = 10
        checkBox.layer.borderWidth = 2
        checkBox.layer.cornerRadius = 10
        checkBox.layer.borderColor = UIColor.specialBlue.cgColor
        checkBox.backgroundColor = .white
        checkBox.alpha = 0
        checkBox.addSubview(upButton)
        checkBox.addSubview(insightsFirstButton)
        checkBox.addSubview(terraDobroFirstButton)
        checkBox.addSubview(insightsSecondButton)
        checkBox.addSubview(terraDobroSecondButton)
        checkBox.addSubview(insightsThirdButton)
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


    private lazy var insightsFirstButton: UIButton = {
        let button = CheckBoxButtonModel()
        button.setTitle("Инсайты", for: .normal)
        button.backgroundColor = .specialGreen
        button.tag = 1
                return button
    }()

    private lazy var terraDobroFirstButton: UIButton = {
        let businesButton = CheckBoxButtonModel()
        businesButton.setTitle("#ТерраДобро", for: .normal)
        businesButton.backgroundColor = .specialGreen
                return businesButton
    }()

    private lazy var insightsSecondButton: UIButton = {
        let terraButton = CheckBoxButtonModel()
        terraButton.setTitle("Инсайты", for: .normal)
        terraButton.backgroundColor = .specialGreen
        return terraButton
    }()

    private lazy var terraDobroSecondButton: UIButton = {
        let businesButton = CheckBoxButtonModel()
        businesButton.setTitle("#ТерраДобро", for: .normal)
        businesButton.backgroundColor = .specialGreen
        return businesButton
    }()

    private lazy var insightsThirdButton: UIButton = {
        let terraButton = CheckBoxButtonModel()
        terraButton.setTitle("Инсайты", for: .normal)
        terraButton.backgroundColor = .specialGreen
        return terraButton
    }()


    private var myContactsLabel = UILabel(text: "Мои контакты", font: .sfProDisplayBold18(), textColor: .black)

    private let editPhoneLabel = UILabel(text: "Телефон", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editPhoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let phoneLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editTelegramNickLabel = UILabel(text: "Никнейм в Телеграмм (если есть)", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editTelegramNickTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let telegramNickLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var editPhoneStackView = UIStackView()
    private var editTelegramNickStackView = UIStackView()
    private var generalStackViewSecond = UIStackView()

    private var aboutMyselfLabel = UILabel(text: "О себе", font: .sfProDisplayBold18(), textColor: .black)

    private let editCityLabel = UILabel(text: "Город", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editCityTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.keyboardType = .alphabet
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let cityLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editBirthdayLabel = UILabel(text: "День рождения", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editBirthdayTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let birthdayLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editInterestsLabel = UILabel(text: "Интересы", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editInterestsTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let interestsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var editCityStackView = UIStackView()
    private var editBirthdayStackView = UIStackView()
    private var editInterestsStackView = UIStackView()
    private var generalStackViewThird = UIStackView()

    private let editDescriptionMyselfLabel = UILabel(text: "Описание", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editDescriptionMyselfTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.contentVerticalAlignment = .top
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var whatUsefulLabel = UILabel(text: "Чем могу быть полезен", font: .sfProDisplayBold18(), textColor: .black)

    private let editResourcesLabel = UILabel(text: "Ресурсы", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editResourcesTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let resourcesLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editExpertiseLabel = UILabel(text: "Экспертиза", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editExpertiseTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let expertiseLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var editResourcesStackView = UIStackView()
    private var editExpertiseStackView = UIStackView()
    private var generalStackViewForth = UIStackView()

    private var whatLookingForLabel = UILabel(text: "Что я ищу", font: .sfProDisplayBold18(), textColor: .black)

    private let editGoalLabel = UILabel(text: "Цель на год", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editGoalTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let goalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let editCommentsLabel = UILabel(text: "Комментарий", font: .sfProDisplayMedium12(), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1))

    private let editCommentsTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = .sfProDisplayBold18()
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let commentsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var editGoalStackView = UIStackView()
    private var editCommentsStackView = UIStackView()
    private var generalStackViewFifth = UIStackView()

    private var myCompaniesLabel = UILabel(text: "Мои компании", font: .sfProDisplayBold18(), textColor: .black)

    private let myCompanyView = MyCompaniesView()

    private lazy var completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.5411764706, blue: 0.9568627451, alpha: 1)
        button.setTitle("Добавить", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .sfProDisplayMedium14()
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        return button
    }()

    private let hashtagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .none
        return collectionView
    }()

    private var hashtagModel = [HashtagModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .black

        setupViews()
        setDelegates()

        hashtagButton.addTarget(self,
                                action: #selector(didTapHashtagButton),
                                for: .touchUpInside)

        upButton.addTarget(self,
                           action: #selector(didTapUpButton),
                           for: .touchUpInside)

        insightsFirstButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.insightsFirstValue += 1
                    self.didTapInsightsFirstButton()
                }), for: .touchUpInside)

        terraDobroFirstButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.terraDobroFirstValue += 1
                    self.didTapTerraDobroFirstButton()
                }), for: .touchUpInside)

        insightsSecondButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.insightsSecondValue += 1
                    self.didTapInsightsSecondButton()
                }), for: .touchUpInside)

        terraDobroSecondButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.terraDobroSecondValue += 1
                    self.didTapTerraDobroSecondButton()
                }), for: .touchUpInside)

        insightsThirdButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.insightsThirdValue += 1
                    self.didTapInsightsThirdButton()
                }), for: .touchUpInside)
                setConstraints()
    }

    private func setDelegates() {
        hashtagCollectionView.delegate = self
        hashtagCollectionView.dataSource = self
    }

    private func setupViews() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        titlesStackView = UIStackView(arrangedSubviews: [changeProfileLabel, changeDataLabel],
                                      axis: .vertical,
                                      spacing: 25)

        editNameStackView = UIStackView(arrangedSubviews: [editNameLabel, editNameTextField, nameLineView],
                                        axis: .vertical,
                                        spacing: 2)

        editLastNameStackView = UIStackView(arrangedSubviews: [editLastNameLabel, editLastNameTextField, lastNameLineView],
                                            axis: .vertical,
                                            spacing: 2)

        editNickStackView = UIStackView(arrangedSubviews: [editNickLabel, editNickTextField, telegramNickLineView],
                                        axis: .vertical,
                                        spacing: 2)

        generalStackViewFirst = UIStackView(arrangedSubviews: [titlesStackView,
                                                               editNameStackView,
                                                               editLastNameStackView,
                                                               editNickStackView
                                                              ],
                                            axis: .vertical,
                                            spacing: 15)

        contentView.addSubview(generalStackViewFirst)
        contentView.addSubview(editHashtagLabel)
        contentView.addSubview(hashtagStackView)

        contentView.addSubview(hashtagCollectionView)
        hashtagCollectionView.register(HashtagCollectionViewCell.self, forCellWithReuseIdentifier: HashtagCollectionViewCell.identifier)

        contentView.addSubview(checkBox)
        contentView.addSubview(myContactsLabel)

        editPhoneStackView = UIStackView(arrangedSubviews: [editPhoneLabel, editPhoneTextField, phoneLineView],
                                         axis: .vertical,
                                         spacing: 2)

        editTelegramNickStackView = UIStackView(arrangedSubviews: [editTelegramNickLabel, editTelegramNickTextField, nickLineView],
                                                axis: .vertical,
                                                spacing: 2)

        generalStackViewSecond = UIStackView(arrangedSubviews: [editPhoneStackView, editTelegramNickStackView],
                                             axis: .vertical,
                                             spacing: 15)

        contentView.addSubview(aboutMyselfLabel)
        contentView.addSubview(generalStackViewSecond)

        editCityStackView = UIStackView(arrangedSubviews: [editCityLabel, editCityTextField, cityLineView],
                                        axis: .vertical,
                                        spacing: 2)

        editBirthdayStackView = UIStackView(arrangedSubviews: [editBirthdayLabel, editBirthdayTextField, birthdayLineView],
                                            axis: .vertical,
                                            spacing: 2)

        editInterestsStackView = UIStackView(arrangedSubviews: [editInterestsLabel, editInterestsTextField, interestsLineView],
                                             axis: .vertical,
                                             spacing: 2)

        generalStackViewThird = UIStackView(arrangedSubviews: [editCityStackView,
                                                               editBirthdayStackView,
                                                               editInterestsStackView,
                                                              ],
                                            axis: .vertical,
                                            spacing: 15)

        contentView.addSubview(generalStackViewThird)
        contentView.addSubview(editDescriptionMyselfLabel)
        contentView.addSubview(editDescriptionMyselfTextField)
        contentView.addSubview(whatUsefulLabel)

        editResourcesStackView = UIStackView(arrangedSubviews: [editResourcesLabel, editResourcesTextField, resourcesLineView],
                                             axis: .vertical,
                                             spacing: 2)

        editExpertiseStackView = UIStackView(arrangedSubviews: [editExpertiseLabel, editExpertiseTextField, expertiseLineView],
                                             axis: .vertical,
                                             spacing: 2)

        generalStackViewForth = UIStackView(arrangedSubviews: [editResourcesStackView, editExpertiseStackView],
                                            axis: .vertical,
                                            spacing: 15)

        contentView.addSubview(generalStackViewForth)
        contentView.addSubview(whatLookingForLabel)

        editGoalStackView = UIStackView(arrangedSubviews: [editGoalLabel, editGoalTextField, goalLineView],
                                        axis: .vertical,
                                        spacing: 2)

        editCommentsStackView = UIStackView(arrangedSubviews: [editCommentsLabel, editCommentsTextField, commentsLineView],
                                            axis: .vertical,
                                            spacing: 2)

        generalStackViewFifth = UIStackView(arrangedSubviews: [editGoalStackView, editCommentsStackView],
                                            axis: .vertical,
                                            spacing: 15)

        contentView.addSubview(generalStackViewFifth)
        contentView.addSubview(myCompaniesLabel)
        contentView.addSubview(myCompanyView)
        contentView.addSubview(completeButton)
    }

    @objc
    func rightHandAction() {
        print("right bar button action")
    }

    @objc
    func choiceButtonTapped() {
        print("helpButtonTapped")
    }

    @objc
    func completeButtonTapped() {
        print("completeButtonTapped")
    }

    @objc private func didTapHashtagButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.checkBox.alpha = 1
        }
    }

    @objc private func didTapUpButton()  {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.checkBox.alpha = 0
            }
        
        hashtagCollectionView.isHidden = false

        hashtagCollectionView.reloadData()
    }

    @objc private func didTapInsightsFirstButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }

            switch self.insightsFirstValue {
            case 0:
                self.insightsFirstButton.backgroundColor = .specialBlue
                self.hashtagModel.append(HashtagModel(nameOfHashtag: self.insightsFirstButton.titleLabel?.text ?? "", imageOfXMark: UIImage(systemName: "xmark")!))

            case 1:
                self.insightsFirstButton.backgroundColor = .specialGreen
                self.insightsFirstValue -= 2
            default:
                self.insightsFirstButton.backgroundColor = .specialBlue
                self.insightsFirstValue = -1
            }
        }
    }

    @objc private func didTapTerraDobroFirstButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }

            switch self.terraDobroFirstValue {
            case 0:
                self.terraDobroFirstButton.backgroundColor = .specialBlue
                self.hashtagModel.append(HashtagModel(nameOfHashtag: self.terraDobroFirstButton.titleLabel?.text ?? "", imageOfXMark: UIImage(systemName: "xmark")!))
            case 1:
                self.terraDobroFirstButton.backgroundColor = .specialGreen
                self.terraDobroFirstValue -= 2
            default:
                self.terraDobroFirstButton.backgroundColor = .specialBlue
                self.terraDobroFirstValue = -1
            }
        }
    }

    @objc private func didTapInsightsSecondButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.insightsSecondValue {
            case 0:
                self.insightsSecondButton.backgroundColor = .specialBlue
                self.hashtagModel.append(HashtagModel(nameOfHashtag: self.insightsSecondButton.titleLabel?.text ?? "", imageOfXMark: UIImage(systemName: "xmark")!))
            case 1:
                self.insightsSecondButton.backgroundColor = .specialGreen
                self.insightsSecondValue -= 2
            default:
                self.insightsSecondButton.backgroundColor = .specialBlue
                self.insightsSecondValue = -1
            }
        }
    }

    @objc private func didTapTerraDobroSecondButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }

            switch self.terraDobroSecondValue {
            case 0:
                self.terraDobroSecondButton.backgroundColor = .specialBlue
                self.hashtagModel.append(HashtagModel(nameOfHashtag: self.terraDobroSecondButton.titleLabel?.text ?? "", imageOfXMark: UIImage(systemName: "xmark")!))
            case 1:
                self.terraDobroSecondButton.backgroundColor = .specialGreen
                self.terraDobroSecondValue -= 2
            default:
                self.terraDobroSecondButton.backgroundColor = .specialBlue
                self.terraDobroSecondValue = -1
            }
        }
    }

    @objc private func didTapInsightsThirdButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.insightsThirdValue {
            case 0:
                self.insightsThirdButton.backgroundColor = .specialBlue
                self.hashtagModel.append(HashtagModel(nameOfHashtag: self.insightsThirdButton.titleLabel?.text ?? "", imageOfXMark: UIImage(systemName: "xmark")!))
            case 1:
                self.insightsThirdButton.backgroundColor = .specialGreen
                self.insightsThirdValue -= 2
            default:
                self.insightsThirdButton.backgroundColor = .specialBlue
                self.insightsThirdValue = -1
            }
        }
    }
}
//MARK: - UICollectionViewDataSource

extension EditProfileViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        hashtagModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashtagCollectionViewCell.identifier, for: indexPath) as! HashtagCollectionViewCell

            let viewModel = hashtagModel[indexPath.row]

        cell.cellConfigure(model: viewModel)

        return cell
    }
}

// MARK: - UICollectionViewDelegate


//MARK: - UICollectionViewDelegateFlowLayout

extension EditProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            CGSize(width: 117,
                   height: 26)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.hashtagCollectionView.deleteItems(at: [indexPath])

        hashtagModel.remove(at: indexPath.item)

        insightsFirstButton.backgroundColor = .specialGreen
        insightsSecondButton.backgroundColor = .specialGreen
        insightsThirdButton.backgroundColor = .specialGreen
        terraDobroFirstButton.backgroundColor = .specialGreen
        terraDobroSecondButton.backgroundColor = .specialGreen
}
}

// MARK: - set constraints
extension EditProfileViewController {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeProfileLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            changeProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            changeProfileLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            editNameTextField.heightAnchor.constraint(equalToConstant: 35),
            editLastNameTextField.heightAnchor.constraint(equalToConstant: 35),
            editNickTextField.heightAnchor.constraint(equalToConstant: 35),

            generalStackViewFirst.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            generalStackViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            nameLineView.heightAnchor.constraint(equalToConstant: 1),
            lastNameLineView.heightAnchor.constraint(equalToConstant: 1),
            nickLineView.heightAnchor.constraint(equalToConstant: 1)

        ])

        NSLayoutConstraint.activate([
            editHashtagLabel.topAnchor.constraint(equalTo: generalStackViewFirst.bottomAnchor, constant: 20),
            editHashtagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            editNickLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            hashtagStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hashtagStackView.topAnchor.constraint(equalTo: editHashtagLabel.bottomAnchor, constant: 20),
            hashtagStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            hashtagStackView.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            hashtagButton.leadingAnchor.constraint(equalTo: hashtagStackView.leadingAnchor),
            hashtagButton.topAnchor.constraint(equalTo: hashtagStackView.topAnchor),
            hashtagButton.trailingAnchor.constraint(equalTo: hashtagStackView.trailingAnchor),
            hashtagButton.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            cornerImage.trailingAnchor.constraint(equalTo: hashtagStackView.trailingAnchor, constant: -17),

            cornerImage.centerYAnchor.constraint(equalTo: hashtagButton.centerYAnchor),
            cornerImage.widthAnchor.constraint(equalToConstant: 15),
            cornerImage.heightAnchor.constraint(equalToConstant: 10)
        ])

        NSLayoutConstraint.activate([
            hashtagCheckBoxLabel.leadingAnchor.constraint(equalTo: hashtagStackView.leadingAnchor, constant: 17),

            hashtagCheckBoxLabel.centerYAnchor.constraint(equalTo: hashtagStackView.centerYAnchor),
            hashtagCheckBoxLabel.widthAnchor.constraint(equalToConstant: 60),
            hashtagCheckBoxLabel.heightAnchor.constraint(equalToConstant: 12)
        ])

        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            checkBox.topAnchor.constraint(equalTo: editHashtagLabel.topAnchor, constant: 20),
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkBox.heightAnchor.constraint(equalToConstant: 134)
        ])

        NSLayoutConstraint.activate([
            upButton.trailingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: -20),
            upButton.topAnchor.constraint(equalTo: checkBox.topAnchor, constant: 15),
            upButton.widthAnchor.constraint(equalToConstant: 17),
            upButton.heightAnchor.constraint(equalToConstant: 13)
        ])

        NSLayoutConstraint.activate([
            insightsFirstButton.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 14),
            insightsFirstButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -64),
            insightsFirstButton.widthAnchor.constraint(equalToConstant: 65),
            insightsFirstButton.heightAnchor.constraint(equalToConstant: 26)
        ])

        NSLayoutConstraint.activate([
            terraDobroFirstButton.leadingAnchor.constraint(equalTo: insightsFirstButton.trailingAnchor, constant: 15),
            terraDobroFirstButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -64),
            terraDobroFirstButton.widthAnchor.constraint(equalToConstant: 91),
            terraDobroFirstButton.heightAnchor.constraint(equalToConstant: 26)
        ])

        NSLayoutConstraint.activate([
            insightsSecondButton.leadingAnchor.constraint(equalTo: terraDobroFirstButton.trailingAnchor, constant: 15),
            insightsSecondButton.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: -64),
            insightsSecondButton.widthAnchor.constraint(equalToConstant: 65),
            insightsSecondButton.heightAnchor.constraint(equalToConstant: 26)
        ])

        NSLayoutConstraint.activate([
            terraDobroSecondButton.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 14),
            terraDobroSecondButton.topAnchor.constraint(equalTo: insightsFirstButton.bottomAnchor, constant: 12),
            terraDobroSecondButton.widthAnchor.constraint(equalToConstant: 91),
            terraDobroSecondButton.heightAnchor.constraint(equalToConstant: 26)
        ])

        NSLayoutConstraint.activate([

            insightsThirdButton.leadingAnchor.constraint(equalTo: terraDobroSecondButton.trailingAnchor, constant: 15),
            insightsThirdButton.topAnchor.constraint(equalTo: terraDobroFirstButton.bottomAnchor, constant: 12),
            insightsThirdButton.widthAnchor.constraint(equalToConstant: 65),
            insightsThirdButton.heightAnchor.constraint(equalToConstant: 26)
        ])

        NSLayoutConstraint.activate([
            checkBoxTitle.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 17),
            checkBoxTitle.topAnchor.constraint(equalTo: checkBox.topAnchor, constant: 15),
            checkBoxTitle.widthAnchor.constraint(equalToConstant: 60),
            checkBoxTitle.heightAnchor.constraint(equalToConstant: 12)
        ])


        NSLayoutConstraint.activate([

            hashtagCollectionView.topAnchor.constraint(equalTo: hashtagButton.topAnchor),
            hashtagCollectionView.leadingAnchor.constraint(equalTo: hashtagButton.leadingAnchor, constant: 5),
            hashtagCollectionView.heightAnchor.constraint(equalTo: hashtagButton.heightAnchor),
            hashtagCollectionView.trailingAnchor.constraint(equalTo: upButton.leadingAnchor, constant: -5)

        ])

        NSLayoutConstraint.activate([
            myContactsLabel.topAnchor.constraint(equalTo: editHashtagLabel.bottomAnchor, constant: 190),
            myContactsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myContactsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            editPhoneTextField.heightAnchor.constraint(equalToConstant: 35),
            editTelegramNickTextField.heightAnchor.constraint(equalToConstant: 35),

            generalStackViewSecond.topAnchor.constraint(equalTo: myContactsLabel.bottomAnchor, constant: 20),
            generalStackViewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            phoneLineView.heightAnchor.constraint(equalToConstant: 1), telegramNickLineView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            aboutMyselfLabel.topAnchor.constraint(equalTo: generalStackViewSecond.bottomAnchor, constant: 55),
            aboutMyselfLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            aboutMyselfLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            editCityTextField.heightAnchor.constraint(equalToConstant: 35),
            editBirthdayTextField.heightAnchor.constraint(equalToConstant: 35),
            editInterestsTextField.heightAnchor.constraint(equalToConstant: 35),

            generalStackViewThird.topAnchor.constraint(equalTo: aboutMyselfLabel.bottomAnchor, constant: 20),
            generalStackViewThird.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackViewThird.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            cityLineView.heightAnchor.constraint(equalToConstant: 1), birthdayLineView.heightAnchor.constraint(equalToConstant: 1),
            interestsLineView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            editDescriptionMyselfLabel.topAnchor.constraint(equalTo: generalStackViewThird.bottomAnchor, constant: 20),
            editDescriptionMyselfLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            editDescriptionMyselfLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            editDescriptionMyselfTextField.topAnchor.constraint(equalTo: editDescriptionMyselfLabel.bottomAnchor, constant: 2),
            editDescriptionMyselfTextField.heightAnchor.constraint(equalToConstant: 85),
            editDescriptionMyselfTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            editDescriptionMyselfTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            whatUsefulLabel.topAnchor.constraint(equalTo: editDescriptionMyselfTextField.bottomAnchor, constant: 55),
            whatUsefulLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            whatUsefulLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            editResourcesTextField.heightAnchor.constraint(equalToConstant: 35),
            editExpertiseTextField.heightAnchor.constraint(equalToConstant: 35),

            generalStackViewForth.topAnchor.constraint(equalTo: whatUsefulLabel.bottomAnchor, constant: 20),
            generalStackViewForth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackViewForth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            resourcesLineView.heightAnchor.constraint(equalToConstant: 1), expertiseLineView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            whatLookingForLabel.topAnchor.constraint(equalTo: generalStackViewForth.bottomAnchor, constant: 55),
            whatLookingForLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            whatLookingForLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            editGoalTextField.heightAnchor.constraint(equalToConstant: 35),
            editCommentsTextField.heightAnchor.constraint(equalToConstant: 35),

            generalStackViewFifth.topAnchor.constraint(equalTo: whatLookingForLabel.bottomAnchor, constant: 20),
            generalStackViewFifth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStackViewFifth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            goalLineView.heightAnchor.constraint(equalToConstant: 1),
            commentsLineView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            myCompaniesLabel.topAnchor.constraint(equalTo: generalStackViewFifth.bottomAnchor, constant: 55),
            myCompaniesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myCompaniesLabel.heightAnchor.constraint(equalToConstant: 20),
        ])

        NSLayoutConstraint.activate([
            myCompanyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myCompanyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            myCompanyView.topAnchor.constraint(equalTo: myCompaniesLabel.bottomAnchor, constant: 17),
            myCompanyView.heightAnchor.constraint(equalToConstant: 160),
        ])

        NSLayoutConstraint.activate([
            completeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            completeButton.topAnchor.constraint(equalTo: myCompanyView.bottomAnchor, constant: 16),
            completeButton.widthAnchor.constraint(equalToConstant: 117),
            completeButton.heightAnchor.constraint(equalToConstant: 38),
            completeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        ])
    }
}

