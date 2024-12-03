//
//  UserModal.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import Foundation


struct UserModal: Codable {
    var firstName: String?
    var lastName: String?
    var email: String?
    var telephone: String?
    var dateOfBirth: Date?
    var address: String?
    var dniNumber: String?
    var dniExpiryDate: Date?
    var licenseNumber: String?
    var licenseExpiryDate: Date?
    var billingAddress: String?
    var policyNumber: String?
    var policyExpiryDate: Date?
    var typeOfPurchase: String?
    var password: String?
    
    var txtDob: String {
        let date = dateOfBirth ?? Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
    
    var txtDniExpiry: String {
        let date = dniExpiryDate ?? Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
    
    var txtLicenseExpiry: String {
        let date = licenseExpiryDate ?? Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
    
    var txtPolicyExpiry: String {
        let date = policyExpiryDate ?? Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
}
