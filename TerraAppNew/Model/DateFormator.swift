//
//  DateFormator.swift
//  TerraAppNew
//
//  Created by Мария Хатунцева on 08.08.2022.
//

import Foundation

extension DateFormatter {
    class func dateFormatter() -> DateFormatter {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return dateformatter
    }
}
