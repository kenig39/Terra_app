//
//  APIService.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//

import Foundation
import Alamofire

final class APIService {
    static let shared = APIService()
    struct Constants {
        static let coursesURL = URL(string: "http://194.58.92.76:9164/get_courses")
    }
    private init () {}
    public func getCourses(completion: @escaping (Result<[String: Any], Error>) -> Void) {
        print("STARTED")
        guard let url = Constants.coursesURL else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let token = UserSettings.shared.access_token
    //    let bearer = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NTk4MTY3ODUsImlhdCI6MTY1OTgxNDk4NSwic2NvcGUiOiJhY2Nlc3Nfd"
        print("TTTTOOOOKKKEEENNN \(token)")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
     //   request.setValue(UIDevice.current.identifierForVendor?.uuidString, forHTTPHeaderField: "Device-ID")
        request.timeoutInterval = 60.0

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Dictionary<String, String>.self, from: data)
                   // print("Courses: \(String(describing: result.self.count))")
                    completion(.success(result.self))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

