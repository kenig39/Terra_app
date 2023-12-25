//
//  CommentsChildViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 08.08.2022.
//

import UIKit

class CommentsChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var commentsTableView: UITableView!
    private var numberOfComments: Int = 23
    private var popularButtonTapped: Int = -1
    private var grayHeartTapped: Int = -1
    private var viewModel = CommentsCellView()
    
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
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Владимир Рыков", comment: "Надеюсь, попаду в этот поток, давно мечтал, всем удачи! Очень хочу узнать про маркетинг! Стажеров не забудьте!", date: "29 июня в 16:40"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Антон Антонов", comment: "И я очень хочу туда", date: "28 июня в 09:40"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Борис Борисов", comment: "И меня не забудьте", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Василий Васильев", comment: "Без меня не начинать!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Глеб Глебов", comment: "Вообще-то я первый занимал!", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Дмитрий Димов", comment: "Надеюсь, попаду в этот поток, давно мечтал, всем удачи!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Егор Егоров", comment: "I dont't understand anything", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Женя Женьский", comment: "Стажеров не забудьте!!!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Зиновий Зиновьев", comment: "iOS-ники круче всех!", date: "28 июня в 09:30"),
        CommentsModel(ava: ((UIImage(named: "man_avatar")) ?? UIImage(systemName: "person")!), name: "Игорь Игорев", comment: "Киса и Ося были тут!", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "speacker_avatar") ?? UIImage(systemName: "person")!), name: "Коста Костин", comment: "Маркетинг форева", date: "28 июня в 09:30"),
        CommentsModel(ava: (UIImage(named: "avatar") ?? UIImage(systemName: "person")!), name: "Лена Ленская", comment: "Свободу попугаям!!!", date: "28 июня в 09:30")
  ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        view.addSubview(zeroLineView)
        view.addSubview(ellipsePic)
        view.addSubview(terraName)
        view.addSubview(numberOfCommentsLabel)
        view.addSubview(popularButton)
        view.addSubview(popularTitleButton)
        self.view.addSubview(commentsTableView)
        
        setupConstraints()
        
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
        viewModel.heartImage.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.grayHeartTapped += 1
                    self.didTapGreyHeartButton()
                }), for: .touchUpInside)
    }
    private func setupView() {
        commentsTableView = UITableView()
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.register(CommentsCellView.self, forCellReuseIdentifier: "CommentsCellView")
        commentsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
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
    @objc private func didTapGreyHeartButton() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            
            switch self.grayHeartTapped {
            case 0:
                self.viewModel.heartImage.alpha = 0
            case 1:
                self.viewModel.heartImage.alpha = 1
                self.grayHeartTapped -= 2
            default:
                self.viewModel.heartImage.alpha = 0
                self.grayHeartTapped = -1
            }
        }
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
            
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            commentsTableView.topAnchor.constraint(equalTo: numberOfCommentsLabel.bottomAnchor, constant: 10),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            commentsTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height),
            
            numberOfCommentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberOfCommentsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            numberOfCommentsLabel.widthAnchor.constraint(equalToConstant: 95.24),
           // numberOfCommentsLabel.heightAnchor.constraint(equalToConstant: 41),
            
            popularButton.trailingAnchor.constraint(equalTo: popularTitleButton.leadingAnchor, constant: -5),
            popularButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 117),
            popularButton.widthAnchor.constraint(equalToConstant: 7),
            popularButton.heightAnchor.constraint(equalToConstant: 3.28),
            
            popularTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popularTitleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            popularTitleButton.widthAnchor.constraint(equalToConstant: 70),
            popularTitleButton.heightAnchor.constraint(equalToConstant: 41)
            
        ])}
}
