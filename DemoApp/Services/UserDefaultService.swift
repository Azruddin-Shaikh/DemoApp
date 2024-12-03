//
//  UserDefaultService.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import Foundation

class UserDefaultService {
    static func setData<T>(value: T?, key: String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        }
    }
    
    static func getData<T>(type: T.Type, forKey: String) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey) as? T
        return value
    }
    
    static func setData<T>(value: T?, key: EUserDefaultsKeys) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key.rawValue)
        }
    }
    
    static func getData<T>(type: T.Type, forKey: EUserDefaultsKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    
    static func remove(_ forKey: EUserDefaultsKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: forKey.rawValue)
    }
}
