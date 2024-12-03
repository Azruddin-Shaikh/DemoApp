//
//  UserDefaultService+User.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import Foundation

extension UserDefaultService {
    static var user: UserModal? {
        get {
            if let data: Data = UserDefaultService.getData(
                type: Data.self,
                forKey: .USER_DATA
            ) {
                return data.decodeTo()
            }
            return nil
        }
        set {
            /// saving current selected attende in UserDefault.
            let encoded = try? JSONEncoder().encode(newValue)
            UserDefaultService.setData(value: encoded, key: .USER_DATA)
        }
    }
}
