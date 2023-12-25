//
//  ExpandableHeaderView.swift
//  TerraAppNew
//
//  Created by Natali on 30.07.2022.
//

import UIKit

//protocol ExpandableHeaderViewDelegate {
//
//    func toggleSection(header: ExpandableHeaderView, section: Int)
//}
//
//class ExpandableHeaderView: UITableViewHeaderFooterView {
//
//    private let arrowDownImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Vector")?.withRenderingMode(.alwaysTemplate)
//        imageView.tintColor = #colorLiteral(red: 0.1843137255, green: 0.5411764706, blue: 0.9568627451, alpha: 1)
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private let chooseLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Выбрать"
//        label.textColor = #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1)
//        label.font = .sfProDisplayMedium12()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    var section: Int!
//    var delegate: ExpandableHeaderViewDelegate?
//
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(clickingOnSubMenu))
//
//        self.addGestureRecognizer(tapHeader)
//
//        addSubview(chooseLabel)
//        addSubview(arrowDownImageView)
//
//        setConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc func clickingOnSubMenu(gestureRecognizer: UITapGestureRecognizer) {
//
//        let cell = gestureRecognizer.view as! ExpandableHeaderView
//        delegate?.toggleSection(header: self, section: cell.section)
//    }
//
//    func customInit(section: Int, delegate: ExpandableHeaderViewDelegate) {
//
//        self.section = section
//        self.delegate = delegate
//    }
//}
//
////MARK: - set constraints
//extension ExpandableHeaderView {
//
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//
//            chooseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
//            chooseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            chooseLabel.heightAnchor.constraint(equalToConstant: 14),
//            chooseLabel.widthAnchor.constraint(equalToConstant: 47)
//        ])
//
//        NSLayoutConstraint.activate([
//            
//            arrowDownImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
//            arrowDownImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            arrowDownImageView.heightAnchor.constraint(equalToConstant: 9),
//            arrowDownImageView.widthAnchor.constraint(equalToConstant: 16)
//        ])
//    }
//}
