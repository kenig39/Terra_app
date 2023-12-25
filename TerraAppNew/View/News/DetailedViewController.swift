//
//  DetailedNewsViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//


import UIKit

class DetailedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: NewsModel?
    private var likesCount: Int = 8596
    private var dislikesCount: Int = 0
    private var dislikeButtonTapped: Int = -1
    private var favoritesTapped: Int = -1
    private var belowFavoritesTapped: Int = -1
    private var commentsTableView: UITableView!
    private var numberOfComments: Int = 23
    private var popularButtonTapped: Int = -1
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let terraName = UILabel(text: "TerraClub", font: .proDisplay14(), textColor: .black, line: 1)
    
    private let ellipsePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_TerraClub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var freshButton: UIButton = {
        let button = ButtonModel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.turquoise
        button.setTitle("Свежие", for: .normal)
        button.titleLabel?.font = UIFont.proDisplay16()
        return button
    }()
    
    private lazy var subscriptionButton: UIButton = {
        let button = ButtonModel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialGray
        button.setTitle("Подписки", for: .normal)
        button.titleLabel?.font = UIFont.proDisplay16()
        return button
    }()
    
    private lazy var favoritesButton: UIButton = {
       let favoritesButton = UIButton()
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.setImage(Constants.Image.favoritesGray, for: .normal)
        favoritesButton.isHidden = true
        return favoritesButton
    }()
    
    private lazy var addButton: UIButton = {
       let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(Constants.Image.addButton, for: .normal)
        addButton.isEnabled = false
        return addButton
    }()
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = Constants.Fonts.SFProDisplay_Bold
        nameLabel.text = "Иван Иванов"
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    private lazy var emailLabel: UILabel = {
        let emailLabel = RegularLabelModel()
        emailLabel.text = "ivan@yandex.ru"
        return emailLabel
    }()
    private lazy var dateLabel: UILabel = {
       let dateLabel = RegularLabelModel()
        dateLabel.text = "27 июня"
        return dateLabel
    }()
    private lazy var descriptionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = Constants.Fonts.SFProDisplay_Medium
        textLabel.textAlignment = .left
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0
        textLabel.text = "Резидент бизнес-клуба Terra рассказывает о 6 инструментах маркетинга, которые позволят вырасти тебе в бизнесе в 2-3 раза быстрее. \n \nСмотри видео до конца, делай свой бизнес успешным с нуля или прокачивай существующий бизнес х10! Становись часть нашего сообщества. Совсем скоро мы анонсируем даты старта нового потока бесплатного образования. Ждете?"
        return textLabel
    }()
    private lazy var hashtagLabel: UILabel = {
        let hashtagLabel = BlueLabelModel()
        hashtagLabel.text = "#terraclub #маркетинг #наставники"
        
        hashtagLabel.isHidden = true
        return hashtagLabel
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
        return commentsLabel
    }()
    private lazy var likeButton: UIButton = {
       let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(Constants.Image.likeButton, for: .normal)
        return likeButton
    }()
    private lazy var likeBlueButton: UIButton = {
       let likeBlueButton = UIButton()
        likeBlueButton.translatesAutoresizingMaskIntoConstraints = false
        likeBlueButton.setImage(Constants.Image.blueCircle, for: .normal)
        likeBlueButton.alpha = 0
        likeBlueButton.addSubview(likeFinger)
        return likeBlueButton
    }()
    private lazy var likeFinger: UIButton = {
       let likeFinger = UIButton()
        likeFinger.translatesAutoresizingMaskIntoConstraints = false
        likeFinger.setImage(Constants.Image.likeFinger, for: .normal)
        return likeFinger
    }()
    private lazy var dislikeButton: UIButton = {
       let dislikeButton = UIButton()
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.setImage(Constants.Image.dislikeButton, for: .normal)
        dislikeButton.layer.cornerRadius = 10
        return dislikeButton
    }()
    private lazy var blueCircle: UIImageView = {
       let blueCircle = UIImageView()
        blueCircle.translatesAutoresizingMaskIntoConstraints = false
        let blueCircleImg = UIImage(named: "blueCircle")
        blueCircle.image = blueCircleImg
        blueCircle.alpha = 0
        return blueCircle
    }()
   lazy var commentButton: UIButton = {
        let commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setImage(Constants.Image.commentButton, for: .normal)
        return commentButton
    }()
    private lazy var belowFavoritesButton: UIButton = {
       let favoritesButton = UIButton()
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
        return favoritesButton
    }()
    private lazy var alertButton: UIButton = {
       let alertButton = UIButton()
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.setImage(Constants.Image.dotsButton, for: .normal)
        alertButton.isEnabled = false
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
    private lazy var line: UIImageView = {
        let line = UIImageView()
        let lineImage = UIImage(named: "line")
        line.image = lineImage
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    private lazy var arrow: UIButton = {
        let arrow = UIButton()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.setImage(Constants.Image.commentArrow, for: .normal)
        arrow.backgroundColor = Constants.Colors.turquoise
        arrow.layer.cornerRadius = 14
        return arrow
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    private lazy var usersComment: UITextField = {
        let usersComment = UITextField()
        usersComment.placeholder = "   Ваш комментарий"
        usersComment.translatesAutoresizingMaskIntoConstraints = false
        usersComment.borderStyle = UITextField.BorderStyle.none
        usersComment.layer.cornerRadius = 20
        usersComment.backgroundColor = Constants.Colors.lightGray?.withAlphaComponent(0.6)
        usersComment.addSubview(arrow)
        return usersComment
    }()
    private lazy var numberOfCommentsLabel: UILabel = {
       let numberOfCommentsLabel = GrayLabelModel()
        numberOfCommentsLabel.text = "\(numberOfComments) комментария"
        return numberOfCommentsLabel
    }()
    private lazy var popularButton: UIButton = {
       let popularButton = UIButton()
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        popularButton.setImage(Constants.Image.upGrayButton, for: .normal)
        return popularButton
    }()
    private let popularTitleButton: UIButton = {
        let popularTitleButton = UIButton()
        popularTitleButton.setTitle("Популярные", for: .normal)
        popularTitleButton.translatesAutoresizingMaskIntoConstraints = false
        popularTitleButton.setTitleColor(Constants.Colors.grayTitles, for: .normal)
        popularTitleButton.titleLabel?.font = Constants.Fonts.SFProDisplay_Regular
        return popularTitleButton
    }()
    private var allComment: [CommentsModel] = [
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Матвей Богатырев", comment: "Ура! Очень хочу узнать про маркетинг!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Владимир Рыков", comment: "Надеюсь, попаду в этот поток, давно мечтал, всем удачи! Очень хочу узнать про маркетинг! Стажеров не забудьте!",  date: "29 июня в 16:40"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Антон Антонов", comment: "И я очень хочу туда",  date: "28 июня в 09:40"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Борис Борисов", comment: "И меня не забудьте",  date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Василий Васильев", comment: "Без меня не начинать!",  date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Глеб Глебов", comment: "Вообще-то я первый занимал!", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Дмитрий Димов", comment: "Надеюсь, попаду в этот поток, давно мечтал, всем удачи!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Егор Егоров", comment: "I dont't understand anything", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Женя Женьский", comment: "Стажеров не забудьте!!!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Зиновий Зиновьев", comment: "iOS-ники круче всех!",  date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Игорь Игорев", comment: "Киса и Ося были тут!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Коста Костин", comment: "Маркетинг форева", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Лена Ленская", comment: "Свободу попугаям!!!", date: "28 июня в 09:30")
  ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(zeroLineView)
        view.addSubview(ellipsePic)
        view.addSubview(terraName)
        view.addSubview(freshButton)
        view.addSubview(subscriptionButton)
        view.addSubview(addButton)
        view.addSubview(favoritesButton)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(dateLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(hashtagLabel)
        view.addSubview(likeLabel)
        view.addSubview(dislikeLabel)
        view.addSubview(commentsLabel)
        view.addSubview(likeButton)
        view.addSubview(likeBlueButton)
        view.addSubview(blueCircle)
        view.addSubview(dislikeButton)
        view.addSubview(commentButton)
        view.addSubview(belowFavoritesButton)
        view.addSubview(alertButton)
        view.addSubview(avatar)
        view.addSubview(mainImage)
        view.addSubview(line)
        setupTableView()
        view.addSubview(stackView)
        view.addSubview(usersComment)
        view.addSubview(numberOfCommentsLabel)
        view.addSubview(popularButton)
        view.addSubview(popularTitleButton)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Новости", style: .plain, target: nil, action: nil)
        setupConstraints()
       
        alertButton.addTarget(self,
                            action: #selector(didTapAlertButton),
                           for: .touchUpInside)
        
        freshButton.addTarget(self,
                         action: #selector(didTapFreshButton),
                         for: .touchUpInside)
        
        subscriptionButton.addTarget(self,
                         action: #selector(didTapSubscriptButton),
                         for: .touchUpInside)
        
        addButton.addTarget(self,
                         action: #selector(didTapAddButton),
                         for: .touchUpInside)
        
        likeButton.addTarget(self,
                         action: #selector(didTapLikeButton),
                         for: .touchUpInside)
        
        likeFinger.addTarget(self,
                         action: #selector(didTapLikeBlueButton),
                         for: .touchUpInside)
        
        dislikeButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.dislikeButtonTapped += 1
                    self.didTapDislikeButton()
                }), for: .touchUpInside)
        
        favoritesButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.favoritesTapped += 1
                    self.didTapFavoritesButton()
                }), for: .touchUpInside)
        
        belowFavoritesButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.belowFavoritesTapped += 1
                    self.didTapBelowFavoritesButton()
                }), for: .touchUpInside)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Новости", style: .plain, target: nil, action: nil)
        
        popularButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.popularButtonTapped += 1
                    self.didTapPopularButton()
                }), for: .touchUpInside)
        
        popularTitleButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.popularButtonTapped += 1
                    self.didTapPopularButton()
                }), for: .touchUpInside)
  //      commentButton.addTarget(self,
    //                     action: #selector(didTapCommentButton),
      //                   for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc func keyboardWillAppear() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.stackView.transform = CGAffineTransform(translationX: 0, y: -310)
            self.usersComment.transform = CGAffineTransform(translationX: 0, y: -310)
        }
    }

    @objc func keyboardWillDisappear() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.stackView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.usersComment.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    private func setupTableView() {
        commentsTableView = UITableView()
        view.addSubview(commentsTableView)
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.register(CommentsCellView.self, forCellReuseIdentifier: "CommentsCellView")
        commentsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
    }
    
    @objc private func didTapAlertButton() {
        let alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "Архивировать запись", style: .default, handler: {  (_) in }))
        alert.addAction(UIAlertAction(title: "Включить комментирование", style: .default, handler: {  (_) in }))
        alert.addAction(UIAlertAction(title: "Скопировать ссылку", style: .default, handler: {  (_) in }))
        alert.addAction(UIAlertAction(title: "Редактировать новость", style: .default, handler: {  (_) in
            let reduct = ReductNewsViewController()
            self.navigationController?.pushViewController(reduct, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Удалить запись", style: .default, handler: { (_) in }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (_) in
               }))
        self.present(alert, animated: true, completion: {
                })
    }
    @objc private func didTapFreshButton() {
        freshButton.backgroundColor = Constants.Colors.turquoise
        subscriptionButton.backgroundColor = .specialGray
        favoritesButton.setImage(Constants.Image.favoritesGray, for: .normal)
    }
    @objc private func didTapSubscriptButton() {
        freshButton.backgroundColor = .specialGray
        subscriptionButton.backgroundColor = Constants.Colors.turquoise
        favoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
    }
    
    @objc private func didTapAddButton() {
        let vc = AddNewsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapLikeButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.likeBlueButton.alpha = 1
            self.likeButton.alpha = 0
            self.likesCount += 1
            let count = String(self.likesCount)
            self.likeLabel.text = count
        }
    }
    @objc private func didTapLikeBlueButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.likeButton.alpha = 1
            self.likeBlueButton.alpha = 0
            self.likesCount -= 1
            let count = String(self.likesCount)
            self.likeLabel.text = count
        }
    }
    @objc private func didTapDislikeButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.dislikeButtonTapped {
            case 0:
                self.blueCircle.alpha = 1
                self.dislikesCount += 1
                let countDislikes = String(self.dislikesCount)
                self.dislikeLabel.text = countDislikes
            case 1:
                self.blueCircle.alpha = 0
                self.dislikeButtonTapped -= 2
                self.dislikesCount -= 1
                let countDislikes = String(self.dislikesCount)
                self.dislikeLabel.text = countDislikes
            default:
                self.blueCircle.alpha = 0
                self.dislikeButtonTapped = -1
            }
        }
    }
    @objc private func didTapFavoritesButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.favoritesTapped {
            case 0:
                self.favoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
            case 1:
                self.favoritesButton.setImage(Constants.Image.favoritesGray, for: .normal)
                self.favoritesTapped -= 2
            default:
                self.favoritesButton.setImage(Constants.Image.favoritesGray, for: .normal)
                self.favoritesTapped = -1
            }
        }
    }
    @objc private func didTapBelowFavoritesButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            switch self.belowFavoritesTapped {
            case 0:
                self.belowFavoritesButton.setImage(Constants.Image.favoritesGray, for: .normal)
            case 1:
                self.belowFavoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
                self.belowFavoritesTapped -= 2
            default:
                self.belowFavoritesButton.setImage(Constants.Image.favoritesButton, for: .normal)
                self.belowFavoritesTapped = -1
            }
        }
    }
    @objc private func didTapPopularButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            
            switch self.popularButtonTapped {
            case 0:
                self.popularButton.setImage(Constants.Image.downGrayButton, for: .normal)
            case 1:
                self.popularButton.setImage(Constants.Image.upGrayButton, for: .normal)
                self.popularButtonTapped -= 2
            default:
                self.popularButton.setImage(Constants.Image.upGrayButton, for: .normal)
                self.popularButtonTapped = -1
            }
        }
    }
    @objc private func didTapCommentButton() {
        let commentsVC = CommentsChildViewController()
        navigationController?.pushViewController(commentsVC, animated: true)
    }
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allComment.count
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCellView", for: indexPath as IndexPath) as! CommentsCellView
        let viewModel = allComment[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            zeroLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1),
            
            terraName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraName.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            terraName.leadingAnchor.constraint(equalTo: ellipsePic.trailingAnchor, constant: 6),
            
            ellipsePic.trailingAnchor.constraint(equalTo: terraName.leadingAnchor, constant: -6),
            ellipsePic.heightAnchor.constraint(equalTo: ellipsePic.widthAnchor, multiplier: 1),
            ellipsePic.centerYAnchor.constraint(equalTo: terraName.centerYAnchor),
            
            freshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            freshButton.topAnchor.constraint(equalTo: zeroLineView.topAnchor, constant: 8),
            freshButton.widthAnchor.constraint(equalToConstant: 117),
            freshButton.heightAnchor.constraint(equalToConstant: 38),
            
            subscriptionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148),
            subscriptionButton.topAnchor.constraint(equalTo: zeroLineView.topAnchor, constant: 8),
            subscriptionButton.widthAnchor.constraint(equalToConstant: 117),
            subscriptionButton.heightAnchor.constraint(equalToConstant: 38),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: subscriptionButton.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 23),
            addButton.heightAnchor.constraint(equalToConstant: 23),
            
            favoritesButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -16),
            favoritesButton.centerYAnchor.constraint(equalTo: subscriptionButton.centerYAnchor),
            favoritesButton.heightAnchor.constraint(equalToConstant: 23),
            
            avatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatar.topAnchor.constraint(equalTo: freshButton.bottomAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 37),
            avatar.heightAnchor.constraint(equalToConstant: 37),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: freshButton.bottomAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 88),
            
            emailLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            emailLabel.widthAnchor.constraint(equalToConstant: 88),
            
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 16),
            
          //  alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            alertButton.centerXAnchor.constraint(equalTo: addButton.centerXAnchor),
            alertButton.bottomAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 16),
            alertButton.heightAnchor.constraint(equalToConstant: 4),
            
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainImage.heightAnchor.constraint(equalToConstant: 219),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 17),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          //  descriptionLabel.heightAnchor.constraint(equalToConstant: 213),
            
            hashtagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hashtagLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 17),
            hashtagLabel.widthAnchor.constraint(equalToConstant: 228.59),
            hashtagLabel.heightAnchor.constraint(equalToConstant: 27.11),
            
            likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likeButton.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 20),
            likeButton.widthAnchor.constraint(equalToConstant: 19.97),
            likeButton.heightAnchor.constraint(equalToConstant: 19.92),
            
            likeBlueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likeBlueButton.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 20),
            likeBlueButton.widthAnchor.constraint(equalToConstant: 20),
            likeBlueButton.heightAnchor.constraint(equalToConstant: 20),
            
            likeFinger.leadingAnchor.constraint(equalTo: likeBlueButton.leadingAnchor),
            likeFinger.topAnchor.constraint(equalTo: likeBlueButton.topAnchor),
            likeFinger.widthAnchor.constraint(equalToConstant: 19.97),
            likeFinger.heightAnchor.constraint(equalToConstant: 19.92),
            
            likeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            likeLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            likeLabel.widthAnchor.constraint(equalToConstant: 35),
            likeLabel.heightAnchor.constraint(equalToConstant: 39),
            
            dislikeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85.22),
            dislikeButton.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 20),
            dislikeButton.widthAnchor.constraint(equalToConstant: 19.97),
            dislikeButton.heightAnchor.constraint(equalToConstant: 19.92),
            
            blueCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85.22),
            blueCircle.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 20),
            blueCircle.widthAnchor.constraint(equalToConstant: 19.97),
            blueCircle.heightAnchor.constraint(equalToConstant: 19.92),
            
            dislikeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 112.29),
            dislikeLabel.centerYAnchor.constraint(equalTo: dislikeButton.centerYAnchor),
            dislikeLabel.widthAnchor.constraint(equalToConstant: 35),
            dislikeLabel.heightAnchor.constraint(equalToConstant: 19),
            
            commentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 134.34),
            commentButton.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 19),
            commentButton.widthAnchor.constraint(equalToConstant: 21.58),
            commentButton.heightAnchor.constraint(equalToConstant: 20.21),
            
            commentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 163.42),
            commentsLabel.centerYAnchor.constraint(equalTo: commentButton.centerYAnchor),
            commentsLabel.widthAnchor.constraint(equalToConstant: 39),
            commentsLabel.heightAnchor.constraint(equalToConstant: 19),
            
            belowFavoritesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            belowFavoritesButton.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 20),
            belowFavoritesButton.heightAnchor.constraint(equalToConstant: 23),
            
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            line.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            line.heightAnchor.constraint(equalToConstant: 2),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            
            usersComment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usersComment.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            usersComment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            usersComment.heightAnchor.constraint(equalToConstant: 36),

            arrow.trailingAnchor.constraint(equalTo: usersComment.trailingAnchor, constant: -6),
            arrow.bottomAnchor.constraint(equalTo: usersComment.bottomAnchor, constant: -4),
            arrow.widthAnchor.constraint(equalToConstant: 28),
            arrow.heightAnchor.constraint(equalToConstant: 28),
            
            numberOfCommentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberOfCommentsLabel.topAnchor.constraint(equalTo: line.topAnchor, constant: 16),
            numberOfCommentsLabel.widthAnchor.constraint(equalToConstant: 95.24),
           // numberOfCommentsLabel.heightAnchor.constraint(equalToConstant: 41),
            
            popularButton.trailingAnchor.constraint(equalTo: popularTitleButton.leadingAnchor, constant: -5),
            popularButton.topAnchor.constraint(equalTo: line.topAnchor, constant: 18),
            popularButton.widthAnchor.constraint(equalToConstant: 7),
            popularButton.heightAnchor.constraint(equalToConstant: 3.28),
            
            popularTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popularTitleButton.topAnchor.constraint(equalTo: line.topAnchor),
            popularTitleButton.widthAnchor.constraint(equalToConstant: 70),
            popularTitleButton.heightAnchor.constraint(equalToConstant: 41),
            
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentsTableView.topAnchor.constraint(equalTo: line.topAnchor, constant: 40),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentsTableView.heightAnchor.constraint(equalToConstant: view.frame.height * 2),
            
            ])
    }
}
