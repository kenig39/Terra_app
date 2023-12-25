////
////  Utilities.swift
////  customauth
////
////  Created by Christopher Ching on 2019-05-09.
////  Copyright © 2019 Christopher Ching. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Alamofire
//
//class Utilities {
//    static func currentTime(competion: @escaping (Date?) -> Void) {
//        let url = Constants.getCurrentTimeURL
//
//        guard let sessionKey: String = UserDefaultsManager().get(for: .sessionKey) else { return }
//        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
//            return
//        }
//        
//        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["Authorization": sessionKey, "Device-ID": deviceID]).response { response in
//            guard response.error == nil else {
//                DispatchQueue.main.async {
//                    print(String(describing: response.error?.localizedDescription))
//                    competion(nil)
//                }
//                return
//            }
//
//            if response.response!.hasSuccessStatusCode {
//                DispatchQueue.main.async {
//                    do {
//                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
//                            let time = Date(timeIntervalSince1970: (json["result"] as? Double)!)
//                            competion(time)
//                        }
//                    } catch let error as NSError {
//                        print("Failed to load: \(error.localizedDescription)")
//                        competion(nil)
//                    }
//
//                }
//            }
//            else {
//                DispatchQueue.main.async {
//                    do {
//                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
//                        }
//                    } catch let error as NSError {
//                        print("Failed to load: \(error.localizedDescription)")
//                    }
//                    competion(nil)
//                }
//            }
//        }
//    }
//
//    static func styleTextField(_ textfield:UITextField) {
//
//        // Create the bottom line
//        let bottomLine = CALayer()
//
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
//
//        bottomLine.backgroundColor = UIColor.init(red: 88/255, green: 198/255, blue: 237/255, alpha: 1).cgColor
//
//        // Remove border on text field
//        textfield.borderStyle = .none
//
//        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder!,
//                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "PlaceholderColor")!])
//
//        // Add the line to the text field
//        textfield.layer.addSublayer(bottomLine)
//
//    }
//
//    static func styleCategoryButton(_ button: UIButton) {
//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0, y: button.frame.height - 2, width: button.frame.width, height: 2)
//
//        bottomLine.backgroundColor = UIColor.black.cgColor
//
//        button.layer.addSublayer(bottomLine)
//    }
//
//    static func styleInfoView(_ view:UIView) {
//
//        let bottomLine = CALayer()
//        let offset: CGFloat = 10
//        bottomLine.frame = CGRect(x: offset, y: view.frame.height - 2, width: view.frame.width - offset * 2, height: 2)
//
//        bottomLine.backgroundColor = UIColor.init(red: 88/255, green: 198/255, blue: 237/255, alpha: 1).cgColor
//
//        view.layer.addSublayer(bottomLine)
//    }
//
//    static func styleHeaderLabel(_ label:UILabel) {
//        label.layer.cornerRadius = 5
//        label.backgroundColor = UIColor(named: "TerraBlue")
//        label.textColor = .white
//    }
//
//    static func styleFilledButton(_ button:UIButton) {
//
//        // Filled rounded corner style
//        button.backgroundColor = UIColor.init(red: 88/255, green: 198/255, blue: 237/255, alpha: 1)
//        button.layer.cornerRadius = 10.0
//        button.tintColor = UIColor.white
//    }
//
//    static func styleButton(_ button:UIButton) {
//
//        // Filled rounded corner style
//        button.backgroundColor = UIColor.init(red: 88/255, green: 198/255, blue: 237/255, alpha: 1)
//        button.layer.cornerRadius = 5.0
//        button.tintColor = UIColor.white
//    }
//
//    static func styleGeoDateButton(_ button:UIButton) {
//
////        button.backgroundColor = UIColor.init(red: 21/255, green: 22/255, blue: 22/255, alpha: 1)
//        button.layer.cornerRadius = 5.0
////        button.layer.borderWidth = 1
////        button.layer.borderColor = UIColor.black.cgColor
//    }
//
//    static func styleHollowButton(_ button:UIButton) {
//
//        // Hollow rounded corner style
//        button.layer.backgroundColor = UIColor.white.cgColor
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.cornerRadius = 10.0
//        button.tintColor = UIColor.black
//    }
//
//    static func isPasswordValid(_ password : String) -> Bool {
//
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9_#?!@$%^&*-]{8,28}+$")
//        return passwordTest.evaluate(with: password)
//    }
//
//    static func isNicknameValid(_ nickname : String) -> Bool {
//
//        let nicknameTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9_-]{5,25}+$")
//
//        return nicknameTest.evaluate(with: nickname)
//    }
//
//    static func isTgNicknameValid(_ nickname : String) -> Bool {
//
//        let nicknameTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9_]{5,33}+$")
//
//        return nicknameTest.evaluate(with: nickname)
//    }
//
//    static func isFullNameValid(_ nickname : String) -> Bool {
//
//        let nicknameTest = NSPredicate(format: "SELF MATCHES %@", "^[А-Яа-я-]{2,40}+$")
//
//        return nicknameTest.evaluate(with: nickname)
//    }
//
//    static func format(with mask: String, phone: String) -> String {
//        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
//        var result = ""
//        var index = numbers.startIndex // numbers iterator
//
//        // iterate over the mask characters until the iterator of numbers ends
//        for ch in mask where index < numbers.endIndex {
//            if ch == "X" {
//                // mask requires a number in this place, so take the next one
//                result.append(numbers[index])
//
//                // move numbers iterator to the next index
//                index = numbers.index(after: index)
//
//            } else {
//                result.append(ch) // just append a mask character
//            }
//        }
//        return result
//    }
//
//    static func formatPhone(with mask: String, phone: String) -> String {
//        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
//        var result = ""
//        var index = numbers.startIndex // numbers iterator
//
//        // iterate over the mask characters until the iterator of numbers ends
//        for ch in mask where index < numbers.endIndex {
//            if ch == "X" {
//                // mask requires a number in this place, so take the next one
//                result.append(numbers[index])
//
//                // move numbers iterator to the next index
//                index = numbers.index(after: index)
//
//            } else {
//                result.append(ch) // just append a mask character
//            }
//        }
//        return result
//    }
//}
//
//public class FooterView: UICollectionReusableView {
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
//
//extension Date {
//
//    static func -(recent: Date, previous: Date) -> (year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
//        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
//        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
//        let year = Calendar.current.dateComponents([.year], from: previous, to: recent).year
//        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
//        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
//        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second
//
//        return (year: year, month: month, day: day, hour: hour, minute: minute, second: second)
//    }
//
//}
