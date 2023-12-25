//
//  NewsAPIModel.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 30.08.2022.
//

import Foundation

struct NewsAPIModel {
    var id: Int
    var header: String
    var description: String
    var category: String
    var archived: String
    var image_list: [String]
}
