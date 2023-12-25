//
//  CoursesTableViewCell.swift
//  TerraAppNew
//
//  Created by gleba on 28.07.2022.
//

import UIKit
import Alamofire

class CoursesTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .specialBackground
        view.applyShadow(cornerRadius: 5)
        return view
    }()
    
    var descriptionLabel = UILabel(text: " ",
                                   font: .systemFont(ofSize: 18, weight: .bold),
                                   color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                   line: 2
    )
    
    var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .none
    }
    
    override func prepareForReuse() {
        picture.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    func configure(viewModel: CoursesAPIModel) {
        
     //   let firstTitleString = "Текущий ответ сервера: \(String(describing: viewModel.description))"
        let firstTitleString = " "
         let secondTitleString = "Временный пример перехода"
        let finishTitleString = firstTitleString + secondTitleString
         let attributedString = NSMutableAttributedString(string: finishTitleString)
         attributedString.addAttribute(.link, value: "https://club-terra.ru/?ysclid=l7fxopp3r8193575483", range: NSRange(location: firstTitleString.count, length: secondTitleString.count))
        
      //  descriptionLabel.text = viewModel.description
        descriptionLabel.attributedText = attributedString
       if let urlStr = viewModel.link {
           guard let url = URL(string: urlStr) else { return }
    //        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
      //           guard let data = data, error == nil else {
        //            return
      // }
        //         DispatchQueue.main.async {
          //           self?.picture.image = UIImage(data: data)
           //      }
            // } .resume()
           AF.request(url, method: .get).response { response in
               if case .success(let data) = response.result {
                   DispatchQueue.main.async {
                       self.picture.image = UIImage(data: data!)
                   }
               } else {
                   print(response.error?.localizedDescription ?? "error response")
               }
           }
       }
    }
    
    //MARK: - SetupViews
    
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(picture)
        containerView.addSubview(descriptionLabel)
    }
    
    
    //MARK: - SetConstraints
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: containerView.topAnchor),
            picture.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            picture.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: picture.leadingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
