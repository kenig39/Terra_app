//
//  UserDefaultsManager.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//

import Foundation

protocol IUserDefaultsManager {
    func cacheData<CachedClass: Codable>(key: UserDefaultsManager.Keys, data: CachedClass)
    func set(key: UserDefaultsManager.Keys, value: [Int])
    func set(key: UserDefaultsManager.Keys, value: Bool)
    func set(key: UserDefaultsManager.Keys, value: String)
    func set(key: UserDefaultsManager.Keys, value: Int)
    func set(key: UserDefaultsManager.Keys, value: TimeInterval)
    func set(key: UserDefaultsManager.Keys, value: Data)

    func get(key: UserDefaultsManager.Keys) -> [Int]?
    func get(for key: UserDefaultsManager.Keys) -> Int
    func get(for key: UserDefaultsManager.Keys) -> String?
    func get(for key: UserDefaultsManager.Keys) -> Double
    func get(for key: UserDefaultsManager.Keys) -> Data?
    func getDataFromCache<CachedClass: Codable>(key: UserDefaultsManager.Keys, type: CachedClass.Type) -> CachedClass?

    func remove(for key: UserDefaultsManager.Keys)
}

final class UserDefaultsManager: IUserDefaultsManager {

    // MARK: Defaults keys

    enum Keys: String {
        case detail = "detail"
        case description = "description"
    }

    private let defaults = UserDefaults.standard

    func set(key: Keys, value: String) {
        defaults.set(value, forKey: key.rawValue)
    }

    func set(key: Keys, value: Bool) {
        defaults.set(value, forKey: key.rawValue)
    }

    func set(key: Keys, value: [Int]) {
        defaults.set(value, forKey: key.rawValue)
    }

    func set(key: Keys, value: Int) {
        defaults.set(value, forKey: key.rawValue)
    }

    func set(key: Keys, value: TimeInterval) {
        defaults.set(value, forKey: key.rawValue)
    }

    func set(key: Keys, value: Data) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func set(key: Keys, value: Dictionary<String, Any>) {
        defaults.set(value, forKey: key.rawValue)
    }

    func cacheData<CachedClass: Codable>(key: Keys, data: CachedClass) {
        if let encoded = try? JSONEncoder().encode(data) {
            defaults.set(encoded, forKey: key.getKeyForClass(key: CachedClass.self))
        }
    }

    func get(key: Keys) -> [Int]? {
        defaults.array(forKey: key.rawValue) as? [Int]
    }

    func getBool(for key: Keys) -> Bool {
        return defaults.bool(forKey: key.rawValue)
    }

    func get(for key: Keys) -> String? {
        return defaults.string(forKey: key.rawValue)
    }

    func get(for key: Keys) -> Int {
        return defaults.integer(forKey: key.rawValue)
    }

    func get(for key: Keys) -> Double {
        return defaults.double(forKey: key.rawValue)
    }

    func get(for key: Keys) -> Data? {
        return defaults.data(forKey: key.rawValue)
    }

    func getDataFromCache<CachedClass: Codable>(key: Keys, type: CachedClass.Type) -> CachedClass? {
        guard let cachedClassData = defaults.data(forKey: key.getKeyForClass(key: CachedClass.self)) else {
            return nil
        }
        return try? JSONDecoder().decode(CachedClass.self, from: cachedClassData)
    }

    func remove(for key: Keys) {
        defaults.removeObject(forKey: key.rawValue)
    }
}

private extension UserDefaultsManager.Keys {
    func getKeyForClass<CachedClass: Codable>(key: CachedClass.Type) -> String {
        return "\(self.rawValue)\(key)"
    }
}

