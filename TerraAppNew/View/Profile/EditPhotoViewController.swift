//
//  EditPhotoViewController.swift
//  Terra_Egor_Profile
//
//  Created by Егор Филиппов on 28.07.2022.
//

import UIKit

class EditPhotoViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let editPhoto = UILabel(text: "Изменить фотографию",
                                    font: .proDisplayBold18(),
                                    textColor: .black,
                                    line: 0)
    
    private let userPaleImagePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pale_man_avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userImagePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man_avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var  downloadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.setTitle("Загрузить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(downloadImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var  changeImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.setTitle("Изменить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var  deleteImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        button.setTitle("Удалить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let editCover = UILabel(text: "Изменить обложку ", font: .systemFont(ofSize: 18), textColor: .black, line: 0)
    
    private let profileBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = #colorLiteral(red: 0.6306069624, green: 0.7299163626, blue: 1, alpha: 1)
        view.image = UIImage(named: "background_profile")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "man_avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var  downloadCoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.setTitle("Загрузить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(downloadCoverButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var  changeCoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.setTitle("Изменить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeCoverButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var  deleteCoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        button.setTitle("Удалить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = #colorLiteral(red: 0.3682977259, green: 0.8083873987, blue: 0.8965508342, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteCoverButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "Готово",
                               style: .done,
                               target: self,
                               action: #selector(rightHandAction))
    }()
    
    override func viewDidLoad() {
        setupViews()
        setupNavBar()
        setConstraint()
    }
    
    private func setupViews() {
        
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .white
        
    
        scrollView.addSubview(editPhoto)
        scrollView.addSubview(userPaleImagePhoto)
        scrollView.addSubview(userImagePhoto)
        
        scrollView.addSubview(downloadImageButton)
        scrollView.addSubview(changeImageButton)
        scrollView.addSubview(deleteImageButton)
        scrollView.addSubview(lineView)
        
        scrollView.addSubview(editCover)
        scrollView.addSubview(profileBackgroundImage)
        scrollView.addSubview(avatarImageView)
        scrollView.addSubview(downloadCoverButton)
        scrollView.addSubview(changeCoverButton)
        scrollView.addSubview(deleteCoverButton)
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItems = [rightBarButtonItem]
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc private func rightHandAction() {
        print("right bar button action")
    }
    
    
    @objc private func downloadImageButtonTapped() {
        alertPhotoOrCamera { [weak self] source in
            guard let self = self else { return }
            self.chooseImagePicker(source: source)
    }
}
    
    @objc private func changeImageButtonTapped() {
        print("change")
    }
    
    @objc private func deleteImageButtonTapped() {
        print("delete")
    }
    
    @objc private func downloadCoverButtonTapped() {
        print("download")
    }
    
    @objc private func changeCoverButtonTapped() {
        print("change")
    }
    
    @objc private func deleteCoverButtonTapped() {
        print("delete")
    }
}
//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension EditPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        userImagePhoto.image = image
        userImagePhoto.contentMode = .scaleAspectFit
        dismiss(animated: true)
    }
}

extension EditPhotoViewController {
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            editPhoto.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            editPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            userPaleImagePhoto.topAnchor.constraint(equalTo: editPhoto.bottomAnchor, constant: 40),
            userPaleImagePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPaleImagePhoto.heightAnchor.constraint(equalToConstant: 358),
            userPaleImagePhoto.widthAnchor.constraint(equalToConstant: 358)
        ])
        
        NSLayoutConstraint.activate([
            userImagePhoto.centerXAnchor.constraint(equalTo: userPaleImagePhoto.centerXAnchor),
            userImagePhoto.centerYAnchor.constraint(equalTo: userPaleImagePhoto.centerYAnchor),
            userImagePhoto.heightAnchor.constraint(equalToConstant: 358),
            userImagePhoto.widthAnchor.constraint(equalToConstant: 358)
        ])
        
        NSLayoutConstraint.activate([
            downloadImageButton.topAnchor.constraint(equalTo: userPaleImagePhoto.bottomAnchor, constant: 32),
            downloadImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            downloadImageButton.heightAnchor.constraint(equalToConstant: 38),
            downloadImageButton.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            changeImageButton.topAnchor.constraint(equalTo: userPaleImagePhoto.bottomAnchor, constant: 32),
//            changeImageButton.leadingAnchor.constraint(equalTo: downloadImageButton.trailingAnchor, constant: 12),
            changeImageButton.centerXAnchor.constraint(equalTo: userPaleImagePhoto.centerXAnchor),
            changeImageButton.heightAnchor.constraint(equalToConstant: 38),
            changeImageButton.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            deleteImageButton.topAnchor.constraint(equalTo: userPaleImagePhoto.bottomAnchor, constant: 32),
            deleteImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            deleteImageButton.heightAnchor.constraint(equalToConstant: 38),
            deleteImageButton.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: downloadImageButton.bottomAnchor, constant: 32),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            editCover.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 32),
            editCover.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            profileBackgroundImage.topAnchor.constraint(equalTo: editCover.bottomAnchor, constant: 32),
            profileBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileBackgroundImage.heightAnchor.constraint(equalToConstant: 179)
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: profileBackgroundImage.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: profileBackgroundImage.bottomAnchor, constant: -90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            downloadCoverButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            downloadCoverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            downloadCoverButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60),
            downloadCoverButton.heightAnchor.constraint(equalToConstant: 38),
            downloadCoverButton.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            changeCoverButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
//            changeImageButton.leadingAnchor.constraint(equalTo: downloadImageButton.trailingAnchor, constant: 12),
            changeCoverButton.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            changeCoverButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60),
            changeCoverButton.heightAnchor.constraint(equalToConstant: 38),
            changeCoverButton.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            deleteCoverButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
//            deleteImageButton.leadingAnchor.constraint(equalTo: changeImageButton.trailingAnchor, constant: 12),
            deleteCoverButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            deleteCoverButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60),
            deleteCoverButton.heightAnchor.constraint(equalToConstant: 38),
            deleteCoverButton.widthAnchor.constraint(equalToConstant: 115)
        ])
    }
}
