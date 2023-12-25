//
//  EditViewController.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 09.08.2022.
//

import UIKit

class EditViewController: UIViewController {

    private let labelTextsModel: [LabelTexts] = LabelTexts.makeModelForLabels()

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


    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        // tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EditTableViewCell.self,
                           forCellReuseIdentifier: EditTableViewCell.identifier)
        return tableView
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937312007, green: 0.9373119473, blue: 0.937312007, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setTitle("   Написать в поддержку", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .sfProDisplayMedium14()
        button.setImage(UIImage(named: "Help")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 50, width: 360, height: 60))
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(rightHandAction))
    }()

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            backButtonLabel()
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        setConstraints()
        setDelegates()
//        setupNavBar()
        setupGradient()
    }

    private func setupViews() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(tableView)
        contentView.addSubview(lineView)
        contentView.addSubview(helpButton)
        contentView.addSubview(exitButton)
    }

//    private func setupNavBar() {
//
//        self.navigationController?.navigationBar.backItem?.title = "Отмена"
//        self.navigationController?.isNavigationBarHidden = false
//
//        navigationItem.rightBarButtonItems = [rightBarButtonItem]
//        self.navigationItem.rightBarButtonItem?.tintColor = .black
//    }

    private func setupGradient() {

        let gradient = CAGradientLayer()
        let colorFirst = #colorLiteral(red: 0.06274509804, green: 0.5803921569, blue: 0.8470588235, alpha: 1).cgColor
        let colorSecond = #colorLiteral(red: 0.3137254902, green: 0.768627451, blue: 0.8705882353, alpha: 1).cgColor

        gradient.colors = [colorFirst, colorSecond]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = exitButton.bounds
        exitButton.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.setTitle("Выйти из аккаунта", for: .normal)
        exitButton.layer.addSublayer(gradient)
        exitButton.titleLabel?.font = .sfProDisplayMedium20()
    }

    private func backButtonLabel(){
            let backButton = UIBarButtonItem()
            backButton.title = "Профиль"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }


    private func layout() {
        view.addSubview(tableView)
    }

    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }


    @objc func rightHandAction() {
        print("right bar button action")
    }

    @objc
    func switchChanged() {
        print("switchChanged")
    }

    @objc
    func helpButtonTapped() {
        print("helpButtonTapped")
    }

    @objc
    func exitButtonTapped() {
        print("helpButtonTapped")
    }

}
// MARK: - set constraints
extension EditViewController {
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
          //  contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 400)
        ])

        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            lineView.topAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            helpButton.widthAnchor.constraint(equalToConstant: 210),
            helpButton.heightAnchor.constraint(equalToConstant: 30),
            helpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            helpButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 30)
        ])

        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            exitButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 100),
            exitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            exitButton.widthAnchor.constraint(equalToConstant: 310),
            exitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

//MARK: - TableViewDataSource

extension EditViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: EditTableViewCell.identifier, for: indexPath) as! EditTableViewCell

        cell.setupCell(labelTextsModel[indexPath.row])

        let switchView = UISwitch(frame: .zero)
        switchView.setOn(true, animated: true)
        switchView.onTintColor = #colorLiteral(red: 0.1843137255, green: 0.5411764706, blue: 0.9568627451, alpha: 1)

        if indexPath.row != 3 {
            cell.addCustomDisclosureIndicator(with: .blue)
        } else {
            switchView.tag = indexPath.row
            switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            cell.accessoryView = switchView
        }
        return cell
    }
}

extension EditViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        if indexPath.row == 2 {
            let editLogVC = NewEditLogViewController()
        //    navigationItem.backButtonTitle = "Назад"
            navigationController?.pushViewController(editLogVC, animated: true)
            
        } else if indexPath.row == 0 {
            let editLogVC = EditPhotoViewController()
            //navigationItem.backButtonTitle = "Назад"
            navigationController?.pushViewController(editLogVC, animated: true)
            
        } else {
            if indexPath.row == 1 {
                let editProfileVC = EditProfileViewController()
             //   navigationItem.backButtonTitle = "Назад"

                navigationController?.pushViewController(editProfileVC, animated: true)
            }
        }
    }
}

