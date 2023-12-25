//
//  URLConstants.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//

import Foundation

struct URLConstants {
    struct Storyboard {
        static let homeViewController = "Tab Bar"
    }
  
    static var mainURL = "http://194.58.92.76:9164"

    static let loginURL = mainURL + "/auth/login"
    static let fetchCoursesURL = mainURL + "/get_courses"
    static let createUserEmailURL = mainURL + "/auth/signup"

}


