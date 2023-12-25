//
//  AlamofireManager.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 30.08.2022.
//

import Foundation
import Alamofire

final class AlamofireManager {
    private let mainQ = DispatchQueue.main

    func makeDecodableRequest<T: Codable>(url: String, method: Alamofire.HTTPMethod, parameters: [String: Any]? = nil, decodableOf: T.Type, completion: @escaping (Result<T, Error>) -> Void) {

        let token: String = UserSettings.shared.access_token
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Device-ID": deviceID
        ]

        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: T.self) { response in
            self.mainQ.async {
                switch response.result {
                case .success(let decodedResult):
                    completion(.success(decodedResult))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func makeEmptyResponseRequest(url: String, method: Alamofire.HTTPMethod, parameters: [String: Any]? = nil, completion: @escaping (Result<Void, Error>) -> Void) {

        let token: String = UserSettings.shared.access_token
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Device-ID": deviceID
        ]

        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
            self.mainQ.async {
                switch response.result {
                case .success(_):
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func downloadImage(url: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        AF.request(url, method: .get).response { response in
            self.mainQ.async {
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                    let responceStr = String(decoding: data!, as: UTF8.self)
                    print("KOKOKOKOKOKOKOKKOO \(responceStr)")
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

struct ImageInfo: Codable {
    let path: String
    let url: String
}

