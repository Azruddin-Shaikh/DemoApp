//
//  MockDataService.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI
import CoreData


struct MockDataService {
    
    static func mockUserData() {
        var user = UserModal()
        user.firstName = "Juan"
        user.lastName = "Deotogilotaux"
        user.email = "johndoe@gmail.com"
        user.telephone = "+34 125-6589"
        user.dateOfBirth = Date()
        user.address = "Alcon Molina 49 Puerto Lumbreras, Murcia 30890"
        user.dniNumber = "12345678"
        user.dniExpiryDate = Date()
        user.licenseNumber = "12345678"
        user.licenseExpiryDate = Date()
        user.billingAddress = "Alcon Molina 49 Puerto Lumbreras, Murcia 30890"
        user.policyNumber = "12345678"
        user.policyExpiryDate = Date()
        user.typeOfPurchase = "Financing and entity"
        user.password = "asdfghjk"
        
        UserDefaultService.user = user
    }
}
