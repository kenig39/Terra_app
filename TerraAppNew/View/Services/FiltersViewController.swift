//
//  FiltreViewController.swift
//  Terra
//
//  Created by Alexander on 28.07.2022.
//

import UIKit

class FiltersViewController: UIViewController {

    let checkbox = FilterCheckbox(frame: CGRect(x: 32, y: 190, width: 24, height: 24))
    let checkbox1 = FilterOneView(frame: CGRect(x: 32, y: 232, width: 24, height: 24))
    let checkbox2 = FilterTwoView(frame: CGRect(x: 32, y: 274, width: 24, height: 24))
    let checkbox3 = FilterThreeView(frame: CGRect(x: 32, y: 316, width: 24, height: 24))

    private lazy var cancelButton: UIButton = {

        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle(" Отмена", for: .normal)
        button.tintColor = .systemBlue
        button.titleLabel?.font = .proDisplay18()
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var readyButton: UIButton = {

        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Готово", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .proDisplayBold18()
        button.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Фильтры"
        label.font = .proDisplayBold18()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let areasLabel: UILabel = {
        let label = UILabel()
        label.text = "Области"
        label.font = .proDisplayBold24()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        
        view.addSubview(firstLineView)
        view.addSubview(areasLabel)
        view.addSubview(cancelButton)
        view.addSubview(readyButton)
        view.addSubview(filterLabel)
        lables()
        setConstraints()
    }

    private func lables(){

        //Lable 1
        let terraClubLable = UILabel(frame: CGRect(x: 65, y: 172, width: 100, height: 60))
        terraClubLable.text = "TerraClub"
        terraClubLable.font = .proDisplay14()
        view.addSubview(terraClubLable)
        view.addSubview(checkbox)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox))
        checkbox.addGestureRecognizer(gesture)

        //Lable 2
        let schoolLable = UILabel()
        schoolLable.text = "Школа Управления"
        schoolLable.font = .proDisplay14()
        view.addSubview(schoolLable)
        view.addSubview(checkbox1)
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox1))
        checkbox1.addGestureRecognizer(gesture1)

        // Lable 3
        let examplLable = UILabel(frame: CGRect(x: 65, y: 256, width: 150, height: 60))
        examplLable.text = "Пример"
        examplLable.font = .proDisplay14()
        view.addSubview(examplLable)
        view.addSubview(checkbox2)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox2))
        checkbox2.addGestureRecognizer(gesture2)

        //Lable4
        let examplLable1 = UILabel(frame: CGRect(x: 65, y: 298, width: 150, height: 60))
        examplLable1.text = "Пример"
        examplLable1.font = .proDisplay14()
        view.addSubview(examplLable1)
        view.addSubview(checkbox3)
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox3))
        checkbox3.addGestureRecognizer(gesture3)
    }

    @objc func didTapCheckBox(){
        checkbox.toggle()
    }

    @objc func didTapCheckBox1(){
        checkbox1.toggle1()
    }

    @objc func didTapCheckBox2(){
        checkbox2.toggle2()
    }

    @objc func didTapCheckBox3(){
        checkbox3.toggle3()
    }
    
    @objc
    func rightHandAction() {
        print("right bar button action")
    }

    @objc func cancelButtonTapped(){
        dismiss(animated: true, completion: nil)
    }

    @objc func readyButtonTapped(){
        dismiss(animated: true, completion: nil)
    }

    private func setConstraints() {

        NSLayoutConstraint.activate([
            firstLineView.topAnchor.constraint(equalTo: areasLabel.bottomAnchor, constant: 20),
            firstLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            
            areasLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 30),
            areasLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 70),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            readyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            readyButton.heightAnchor.constraint(equalToConstant: 30),
            readyButton.widthAnchor.constraint(equalToConstant: 70),
            readyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
            filterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            filterLabel.heightAnchor.constraint(equalToConstant: 30),
            filterLabel.widthAnchor.constraint(equalToConstant: 90),
            filterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}



