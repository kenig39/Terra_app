//
//  ServicesViewController.swift
//  TerraAppNew
//
//  Created by gleba on 28.07.2022.
//

import UIKit

class CoursesViewController: UIViewController {
    private(set) var categories: [CoursesAPIModel]?
    var coursesViewModel: [CoursesAPIViewModel]?
    
    var data = ImagesForTest()
    var collectionData = ChatsImages()
    
    private let servicesLabel = UILabel(text: "Сервисы",
                                        font: .proDisplayBold18(),
                                        color: .black,
                                        line: 1)
    
    private let terraClubLabel = UILabel(text: "TerraClub",
                                         font: .proDisplay14(),
                                         textColor: .black,
                                         line: 1)
    
    private let schoolEventModel:[SchoolEventModel] = SchoolEventModel.makeModelForEvent()
    
    private let ellipsePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_TerraClub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coursesButton: UIButton = {
        let button = ButtonModel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.turquoise
        button.setTitle("Курсы", for: .normal)
        button.titleLabel?.font = UIFont.proDisplay16()
        return button
    }()
    
    private lazy var chatsButton: UIButton = {
        let button = ButtonModel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.turquoise
        button.setTitle("Чаты", for: .normal)
        button.titleLabel?.font = UIFont.proDisplay16()
        return button
    }()
    
    private lazy var developmentsButton: UIButton = {
        let button = ButtonModel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.turquoise
        button.setTitle("События", for: .normal)
        button.titleLabel?.font = UIFont.proDisplay16()
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 29
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let onlineSchoolLabel: UILabel = {
        let label = UILabel()
        label.text = "Онлайн-школа"
        label.font = .proDisplayBold24()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coursesTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.delaysContentTouches = true
        tableView.bounces = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        tableView.separatorColor = .clear
        tableView.layer.cornerRadius = 5
        return tableView
    }()
    
    private let developmentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.delaysContentTouches = true
        tableView.bounces = true
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        tableView.separatorColor = .clear
        tableView.layer.cornerRadius = 5
        return tableView
    }()
    
    private let developmentsLabel: UILabel = {
        let label = UILabel()
        label.text = "События"
        label.font = .proDisplayBold24()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "icon"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let chatsLabel: UILabel = {
        let label = UILabel()
        label.text = "Чаты"
        label.font = .proDisplayBold24()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chatsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
     //   collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.bounces = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private func setDelegate() {
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        
        developmentsTableView.delegate = self
        developmentsTableView.dataSource = self
        
        chatsCollection.delegate = self
        chatsCollection.dataSource = self
    }
    
    @objc private func filterButtonTapped() {
        showFilterViewControllerInACustomizedSheet()
    }
    
    @objc func showCoursesAction() {
        
        coursesTableView.isHidden = false
        onlineSchoolLabel.isHidden = false
        developmentsTableView.isHidden = true
        developmentsLabel.isHidden = true
        chatsCollection.isHidden = true
        chatsLabel.isHidden = true
        filterButton.isHidden = true
        coursesButton.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1)
        chatsButton.backgroundColor = .specialGray
        developmentsButton.backgroundColor = .specialGray
    }
    
    @objc func showChatsAction(sender: UIButton!) {
        
        coursesTableView.isHidden = true
        onlineSchoolLabel.isHidden = true
        developmentsTableView.isHidden = true
        developmentsLabel.isHidden = true
        chatsCollection.isHidden = false
        chatsLabel.isHidden = false
        filterButton.isHidden = true
        chatsButton.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1)
        coursesButton.backgroundColor = .specialGray
        developmentsButton.backgroundColor = .specialGray
    }
    
    @objc func showDevelopmentsAction() {
        
        coursesTableView.isHidden = true
        onlineSchoolLabel.isHidden = true
        developmentsTableView.isHidden = false
        developmentsLabel.isHidden = false
        chatsLabel.isHidden = true
        chatsCollection.isHidden = true
        filterButton.isHidden = false
        developmentsButton.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1)
        coursesButton.backgroundColor = .specialGray
        chatsButton.backgroundColor = .specialGray
    }
    
    private let сoursesTableViewCellID = "сoursesTableViewCell"
    private let developCellID = "developTableViewCell"
    private let chatsCollectionViewID = "chatsCollectionViewID"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setFirstParameters()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegate()
        setSegue()
        setupNavBar()
        
        coursesTableView.register(CoursesTableViewCell.self, forCellReuseIdentifier: сoursesTableViewCellID)
        developmentsTableView.register(DevelopmentsTableViewCell.self, forCellReuseIdentifier: developCellID)
        chatsCollection.register(ChatsCollectionViewCell.self, forCellWithReuseIdentifier: chatsCollectionViewID)
        fetchCourses()
    }
 //   private func fetchCourses() {
   //     APIService.shared.getCourses { [weak self] result in
    //        switch result {
     //       case .success(let courses):
      //          let testResponse = courses.compactMap({
              //  self?.coursesViewModel = courses.compactMap({
       //             CoursesAPIViewModel(
                     //   id: $0.id ?? 0,
         //               link: (URL(string: $0.value as! String ?? "") ?? URL(string: //"https://www.neizvestniy-geniy.ru/images/works/photo/2013/12/1093681_1.jpg"))!,
              //          description: courses["description"] as? String ?? "No Description"
                     
              //      )
              //  })
 //               DispatchQueue.main.async {
   //                 self?.coursesTableView.reloadData()
     //           }
     //       case .failure(let error):
      //          print(error)
        //    }
       // }
        
 //   }
    func fetchCourses() {
      //  var parameters: Dictionary<String, String> = [:]
        //let token = UserSettings.shared.access_token
          //  parameters["Authorization"] = "Bearer \(token)"
      
            let url = "http://194.58.92.76:9164/get_courses"
        AlamofireManager().makeDecodableRequest(url: url, method: .get, decodableOf: [CoursesAPIModel].self) { result in
            switch result {
            case .success(let data):
                self.categories = data
            //    print("HEREHEHERHEH \(self.categories)")
                
                print("SUPER")
                self.coursesTableView.reloadData()
            case .failure(let error):
                print("FUCK")
                self.categories = []
                print(error)
            }
        }
        
    }


    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(servicesLabel)
        view.addSubview(ellipsePic)
        view.addSubview(terraClubLabel)
        view.addSubview(separatorView)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(coursesButton)
        buttonStackView.addArrangedSubview(chatsButton)
        buttonStackView.addArrangedSubview(developmentsButton)
        
        view.addSubview(onlineSchoolLabel)
        view.addSubview(zeroLineView)
        view.addSubview(coursesTableView)
        
        view.addSubview(developmentsTableView)
        view.addSubview(developmentsLabel)
        
        view.addSubview(chatsLabel)
        view.addSubview(chatsCollection)
        view.addSubview(filterButton)
    }
    
    private func setSegue() {
        chatsButton.addTarget(self, action: #selector(showChatsAction), for: .touchUpInside)
        developmentsButton.addTarget(self, action: #selector(showDevelopmentsAction), for: .touchUpInside)
        coursesButton.addTarget(self, action: #selector(showCoursesAction), for: .touchUpInside)
    }
    
    func showFilterViewControllerInACustomizedSheet() {
        let viewControllerToPresent = FiltersViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.preferredCornerRadius = 30
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    func showSchollViewControllerInACustomizedSheet() {
        let viewControllerToPresent = SchoolOfManagViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    private func setFirstParameters() {
      //  view.addSubview(onlineSchoolLabel)
        view.addSubview(coursesTableView)
        
        developmentsLabel.isHidden = true
        chatsLabel.isHidden = true
        filterButton.isHidden = true
        
        coursesButton.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1)
        chatsButton.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        developmentsButton.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
    }
    
    private func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - UITableViewDataSource

extension CoursesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int!
        if tableView == coursesTableView {
            count = data.images.count
        }
        if tableView == developmentsTableView {
            count = schoolEventModel.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == coursesTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: сoursesTableViewCellID, for: indexPath) as! CoursesTableViewCell
         //   cell.picture.image = data.images[indexPath.row]
           // cell.descriptionLabel.text = data.descriptions[indexPath.row]
            guard let coursesCell = categories?[indexPath.row] else {
                cell.picture.image = data.images[indexPath.row]
                cell.descriptionLabel.text = data.descriptions[indexPath.row]
                return cell
            }
            cell.configure(viewModel: coursesCell)
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: developCellID, for: indexPath) as! DevelopmentsTableViewCell
            cell.setupCell(schoolEventModel[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
}
//MARK: - UITableViewDelegate
extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == coursesTableView {
            return tableView.frame.height / 3.5
        } else {
            return tableView.frame.height / 2.3
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == developmentsTableView {
            showSchollViewControllerInACustomizedSheet()
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let urlStr = "https://club-terra.ru/?ysclid=l7fxopp3r8193575483"
           if let url = URL(string: "\(urlStr)"), !url.absoluteString.isEmpty {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
    }
}
// MARK: - UICollectionViewDataSource

extension CoursesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.chatsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = chatsCollection.dequeueReusableCell(withReuseIdentifier: chatsCollectionViewID, for: indexPath) as! ChatsCollectionViewCell
        cell.chatsImageView.image = collectionData.chatsImages[indexPath.row]
        cell.descriptionLabel.text = collectionData.chatsDescriptions[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CoursesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: chatsCollection.frame.width / 2 - 10, height: 216)
    }
}
// MARK: - setup constraints

extension CoursesViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            servicesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            servicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            ellipsePic.trailingAnchor.constraint(equalTo: terraClubLabel.leadingAnchor, constant: -6),
            ellipsePic.heightAnchor.constraint(equalTo: ellipsePic.widthAnchor, multiplier: 1),
            ellipsePic.centerYAnchor.constraint(equalTo: servicesLabel.centerYAnchor),
            
            terraClubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            terraClubLabel.centerYAnchor.constraint(equalTo: servicesLabel.centerYAnchor),
            terraClubLabel.leadingAnchor.constraint(equalTo: ellipsePic.trailingAnchor, constant: 6),
            
            separatorView.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 12),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            buttonStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: servicesLabel.leadingAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 38),
            
            onlineSchoolLabel.leadingAnchor.constraint(equalTo:servicesLabel.leadingAnchor),
            onlineSchoolLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            
            zeroLineView.topAnchor.constraint(equalTo: onlineSchoolLabel.bottomAnchor, constant: 10),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1),
            
            coursesTableView.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 0),
            coursesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            coursesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            coursesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            developmentsTableView.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 0),
            developmentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            developmentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            developmentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            developmentsLabel.leadingAnchor.constraint(equalTo:servicesLabel.leadingAnchor),
            developmentsLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            
            filterButton.heightAnchor.constraint(equalToConstant: 20),
            filterButton.widthAnchor.constraint(equalToConstant: 30),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            filterButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 13),
            
            chatsLabel.leadingAnchor.constraint(equalTo:servicesLabel.leadingAnchor),
            chatsLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            
            chatsCollection.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 3),
            chatsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chatsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chatsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
