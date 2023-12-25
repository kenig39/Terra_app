//
//  NewsViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 07.08.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsCellView.self, forCellReuseIdentifier: "MyCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Constants.Image.favoritesGray, for: .normal)
        
        button.isHidden = true
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(Constants.Image.addButton, for: .normal)
        addButton.isEnabled = true
        
      //  addButton.isHidden = true
        return addButton
    }()
    
    private lazy var newsTitle: UILabel = {
        let newsTitle = UILabel()
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.text = "Новости"
        newsTitle.font = Constants.Fonts.SFProDisplay_Bold18
        return newsTitle
    }()
    
    private let terraName = UILabel(text: "TerraClub", font: .proDisplay14(), textColor: .black, line: 1)
    
    private let ellipsePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_TerraClub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        backButtonLabel()
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setDelegates()
        setupConstraints()
        setupTargets()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(newsTitle)
        view.addSubview(ellipsePic)
        view.addSubview(terraName)
        view.addSubview(zeroLineView)
        view.addSubview(firstLineView)
        view.addSubview(newsTableView)
        view.addSubview(freshButton)
        view.addSubview(subscriptionButton)
        view.addSubview(addButton)
        view.addSubview(favoritesButton)
    }
    
    private func setDelegates() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
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
        let addNewsViewController = AddNewsViewController()
        navigationController?.pushViewController(addNewsViewController, animated: true)
    }
    //    private func backButtonLabel(){
    //        let backButton = UIBarButtonItem()
    //        backButton.title = "Новости"
    //        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    //    }
}

//MARK: - SetupTargets
extension NewsViewController {
    private func setupTargets() {
        freshButton.addTarget(self,
                              action: #selector(didTapFreshButton),
                              for: .touchUpInside)
        
        subscriptionButton.addTarget(self,
                                     action: #selector(didTapSubscriptButton),
                                     for: .touchUpInside)
        
        addButton.addTarget(self,
                            action: #selector(didTapAddButton),
                            for: .touchUpInside)
    }
}

//MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) as! NewsCellView
        let vc = NewsCellView()
        let listOfNews: [NewsModel] = [NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container)]
        let viewModel = listOfNews[indexPath.row]
        cell.configure(viewModel)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 468
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.newsTableView.deselectRow(at: indexPath, animated: true)
        
        let vc = NewsCellView()
        let listOfNews: [NewsModel] = [NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container),
                                       NewsModel(news: vc.container)]
        let selectedNews = listOfNews[indexPath.row]
        let detailVC = DetailedViewController()
        detailVC.viewModel = selectedNews
        detailVC.modalPresentationStyle = .fullScreen
        
        let backButton = UIBarButtonItem()
        backButton.title = "Новости"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - SetConstraints
extension NewsViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            newsTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            newsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            ellipsePic.trailingAnchor.constraint(equalTo: terraName.leadingAnchor, constant: -6),
            ellipsePic.heightAnchor.constraint(equalTo: ellipsePic.widthAnchor, multiplier: 1),
            ellipsePic.centerYAnchor.constraint(equalTo: terraName.centerYAnchor),
            
            terraName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraName.centerYAnchor.constraint(equalTo: newsTitle.centerYAnchor),
            terraName.leadingAnchor.constraint(equalTo: ellipsePic.trailingAnchor, constant: 6),
            
            zeroLineView.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 12),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1),
            
            freshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            freshButton.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 10),
            freshButton.widthAnchor.constraint(equalToConstant: 117),
            freshButton.heightAnchor.constraint(equalToConstant: 38),
            
            subscriptionButton.leadingAnchor.constraint(equalTo: freshButton.trailingAnchor, constant: 16),
            subscriptionButton.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 10),
            subscriptionButton.widthAnchor.constraint(equalToConstant: 117),
            subscriptionButton.heightAnchor.constraint(equalToConstant: 38),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: subscriptionButton.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 23),
            addButton.heightAnchor.constraint(equalToConstant: 23),
            
            favoritesButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -16),
            favoritesButton.centerYAnchor.constraint(equalTo: subscriptionButton.centerYAnchor),
            favoritesButton.heightAnchor.constraint(equalToConstant: 23),
            
            firstLineView.topAnchor.constraint(equalTo: freshButton.bottomAnchor, constant: 10),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsTableView.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 2),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
