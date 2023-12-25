//
//  labelsData.swift
//  TerraAppNew
//
//  Created by Natali on 27.07.2022.
//

import Foundation

struct LabelTexts {
    let description: String

static func makeModelForLabels() -> [LabelTexts] {

var section = [LabelTexts]()

    section.append(LabelTexts(description: "Изменить фотографию и обложку"))
    section.append(LabelTexts(description: "Изменить профиль"))
    section.append(LabelTexts(description: "Изменить логин и пароль"))
    section.append(LabelTexts(description: "Светлая тема"))

    return section

}

    static func makeModelForLogLabels() -> [LabelTexts] {

    var section = [LabelTexts]()

        section.append(LabelTexts(description: "Логин"))
        section.append(LabelTexts(description: "Старый пароль"))
        section.append(LabelTexts(description: "Новый пароль"))
        section.append(LabelTexts(description: "Повторите пароль"))

        return section

    }


}
