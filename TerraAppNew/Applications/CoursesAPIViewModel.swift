//
//  CoursesAPIViewModel.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//


import UIKit

class CoursesAPIViewModel {
  //  var id: Int?
    var link: URL?
    var description: String?
    init(
    //    id: Int,
        link: URL,
        description: String
    ) {
    //    self.id = id
        self.link = link
       self.description = description
    }
}
