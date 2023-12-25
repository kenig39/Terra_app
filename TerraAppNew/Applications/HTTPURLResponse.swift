//
//  HTTPsResponse.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 29.08.2022.
//

import Foundation

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}
