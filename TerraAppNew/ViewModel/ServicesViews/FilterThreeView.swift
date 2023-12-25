//
//  FilterThreeView.swift
//  TerraAppNew
//
//  Created by Natali on 05.08.2022.
//


import UIKit

class FilterThreeView: UIView {
    
    var isChecked = false
    
    let imgageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 9
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = #colorLiteral(red: 0.1843137255, green: 0.5411764706, blue: 0.9568627451, alpha: 1)
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "checkmark.square.fill")
        return imageView
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 6
        view.contentMode = .scaleToFill
        view.layer.borderColor = #colorLiteral(red: 0.1843137255, green: 0.5411764706, blue: 0.9568627451, alpha: 1).cgColor
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(boxView)
        addSubview(imgageView)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        boxView.frame = CGRect(x: 2, y: 2, width: frame.size.width - 4, height: frame.size.width - 4)
        imgageView.frame = bounds
    }
    
    public func toggle3(){
        self.isChecked = !isChecked
        imgageView.isHidden = !isChecked
    }
}
