//
//  UserSettingsAPI.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//

import Foundation

class UserSettings: ObservableObject {
    static let shared = UserSettings()
    @Published var access_token: String{
        didSet {
            UserDefaults.standard.set(access_token, forKey: "access_token")
        }
    }
    init() {
        self.access_token = UserDefaults.standard.object(forKey: "access_token") as? String ?? ""
    }
}
