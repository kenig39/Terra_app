//
//  ServiceImages.swift
//  TerraAppNew
//
//  Created by gleba on 28.07.2022.
//

import UIKit

class ImagesForTest{
    
    var images = [UIImage]()

    var descriptions = [String]()
    
    func addImages(){
        images.append(addImage(name: "wildberries"))
        descriptions.append("2-х недельный спринт по WB")

        images.append(addImage(name: "marketingCourse"))
        descriptions.append("Курс по маркетингу")

        images.append(addImage(name: "sellsCourse"))
        descriptions.append("Курс по продажам")

        images.append(addImage(name: "master-classes"))
        descriptions.append("Мастер-классы")
    }

    func addImage(name:String) -> UIImage{
        let image = UIImage(named: name) ?? UIImage()
        return image
    }

    init (){
        addImages()
    }
}
