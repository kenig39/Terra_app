//
//  FullNewsViewController.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 08.08.2022.
//

import UIKit

class FullNewsViewController: UIViewController {
    
    private let comments = CommentsChildViewController()
    private let detailedView = DetailedViewController()
    var viewModel: NewsModel?
    
    private let zeroLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var terraName: UILabel = {
        let terraName = UILabel(frame: CGRect(x: 335, y: 62, width: 50, height: 20))
        terraName.font = Constants.Fonts.Regular
        terraName.text = "TerraClub"
        return terraName
    }()
    
    private let ellipsePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_TerraClub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var arrow: UIButton = {
        let arrow = UIButton()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.setImage(Constants.Image.commentArrow, for: .normal)
        arrow.backgroundColor = Constants.Colors.turquoise
        arrow.layer.cornerRadius = 14
        return arrow
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addChildren()
        setupConstraints()
        
        detailedView.commentButton.addTarget(self,
                         action: #selector(didTapCommentButton),
                         for: .touchUpInside)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Новости", style: .plain, target: nil, action: nil)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(zeroLineView)
        view.addSubview(ellipsePic)
        view.addSubview(terraName)
      //  view.addSubview(stackView)
        view.addSubview(usersComment)
    }
    
    private func addChildren() {
        addChild(detailedView)
        detailedView.didMove(toParent: self)
        detailedView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailedView.view)
        
        addChild(comments)
        comments.didMove(toParent: self)
        comments.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(comments.view)
    }
    
    @objc private func didTapCommentButton() {
        NSLayoutConstraint.activate([
        detailedView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        detailedView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        detailedView.view.topAnchor.constraint(equalTo: view.topAnchor),
        detailedView.view.bottomAnchor.constraint(equalTo: comments.view.topAnchor),
        
        detailedView.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
        comments.view.topAnchor.constraint(equalTo: view.topAnchor),
        comments.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        comments.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        comments.view.heightAnchor.constraint(equalToConstant: view.frame.height)])
        
//        detailedView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        detailedView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        detailedView.view.topAnchor.constraint(equalTo: view.topAnchor),
//      //  detailedView.view.bottomAnchor.constraint(equalTo: comments.view.topAnchor),
//
//        detailedView.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
//
//        comments.view.topAnchor.constraint(equalTo: detailedView.view.bottomAnchor),
//        comments.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        comments.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        comments.view.heightAnchor.constraint(equalToConstant: view.frame.height)])
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            zeroLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            zeroLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            zeroLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            zeroLineView.heightAnchor.constraint(equalToConstant: 1),
            
            detailedView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailedView.view.topAnchor.constraint(equalTo: zeroLineView.bottomAnchor, constant: 12),
          //  detailedView.view.bottomAnchor.constraint(equalTo: comments.view.topAnchor),
            detailedView.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75),
            
            comments.view.topAnchor.constraint(equalTo: detailedView.view.bottomAnchor, constant: 0),
            comments.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            comments.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            comments.view.heightAnchor.constraint(equalToConstant: view.frame.height),
            
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 140),
            
            usersComment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usersComment.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            usersComment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            usersComment.heightAnchor.constraint(equalToConstant: 36),

            arrow.trailingAnchor.constraint(equalTo: usersComment.trailingAnchor, constant: -6),
            arrow.bottomAnchor.constraint(equalTo: usersComment.bottomAnchor, constant: -4),
            arrow.widthAnchor.constraint(equalToConstant: 28),
            arrow.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}

