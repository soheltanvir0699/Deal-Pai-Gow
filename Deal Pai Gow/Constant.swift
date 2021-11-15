//
//  Constant.swift
//  Deal Pai Gow
//
//  Created by Sohel Rana on 15/11/21.
//

import Foundation

public class Constant: NSObject {
    static var isFirstTimeOpen: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "Firstime")
        } get {
            var str_user_value = false
            if UserDefaults.standard.value(forKey: "Firstime") != nil {
                str_user_value = UserDefaults.standard.value(forKey: "Firstime") as! Bool
            }
            return str_user_value
        }
    }
    static var storyboardName: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "storyboardName")
        } get {
            var str_user_value = ""
            if UserDefaults.standard.value(forKey: "storyboardName") != nil {
                str_user_value = UserDefaults.standard.value(forKey: "storyboardName") as! String
            }
            return str_user_value
        }
    }
}
