//
//  Data+Extension.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import Foundation

extension Data {
    func decodeTo<T: Decodable>() -> T?  {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch (let error) {
            print("decodeTo() FAIL : ", error.localizedDescription)
            return nil
        }
    }
}
