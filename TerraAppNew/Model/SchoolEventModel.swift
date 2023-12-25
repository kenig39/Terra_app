//
//  SchoolEventModel.swift
//  TerraAppNew
//
//  Created by Natali on 06.08.2022.
//

import UIKit

struct SchoolEventModel {

    let schoolName: String
    var speakerImage: UIImage?
    let speakerName: String
    let speakerPosition: String
    let dateAndTimeOfEvent: String
    let hashtagsInfo: String
    

    static func makeModelForEvent() -> [SchoolEventModel] {

        var model = [SchoolEventModel]()

        model.append(SchoolEventModel(schoolName: "Школа УПРАВЛЕНИЯ", speakerImage: UIImage(named: "foto")!, speakerName: "РАСУЛОВ Шухрат", speakerPosition: "ОСНОВАТЕЛЬ Терра", dateAndTimeOfEvent: "12:00 Вс, 2 мая 2022", hashtagsInfo: "#terraclub #школаУПРАВЛЕНИЯ"))

        model.append(SchoolEventModel(schoolName: "УНИВЕРСИТЕТ Гениев", speakerImage: UIImage(named: "foto")!, speakerName: "ИВАНОВ Иван", speakerPosition: "ДЕКАН факультета ...", dateAndTimeOfEvent: "12:00 Вс, 10 мая 2022", hashtagsInfo: "#terraclub #университеты"))

        model.append(SchoolEventModel(schoolName: "ИНСТИТУТ культуры", speakerImage: UIImage(named: "marketingCourse")!, speakerName: "Петров Петр", speakerPosition: "Ректор", dateAndTimeOfEvent: "10:00 Вс, 17 мая 2022", hashtagsInfo: "#terraclub #культура"))

        return model
    }
}

