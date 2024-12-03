//
//  MyProfileObserver.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

class MyProfileObserver: ObservableObject {
    
    @Published var user: UserModal = UserDefaultService.user ?? UserModal()
    
    @Published var tfTelephone: String = ""
    @Published var tfDob: String = ""
    @Published var tfAddress: String = ""
    @Published var tfBillingAddress: String = ""
    @Published var tfTypeOfPurchase: String = ""
    @Published var tfPassword: String = ""
    
    @Published var tfDINno: String = ""
    @Published var tfDINExpiry: String = ""
    
    @Published var tfLicenseno: String = ""
    @Published var tfLicenseExpiry: String = ""
    
    
    @Published var tfPolicyno: String = ""
    @Published var tfPolicyExpiry: String = ""
    
    init() {
        setUserData()
    }
    
    func setUserData() {
        tfTelephone = user.telephone ?? ""
        tfDob = user.txtDob
        tfAddress = user.address ?? ""
        tfBillingAddress = user.billingAddress ?? ""
        tfTypeOfPurchase = user.typeOfPurchase ?? ""
        tfDINno = user.dniNumber ?? ""
        tfDINExpiry = user.txtDniExpiry
        tfLicenseno = user.licenseNumber ?? ""
        tfLicenseExpiry = user.txtLicenseExpiry
        tfPolicyno = user.policyNumber ?? ""
        tfPolicyExpiry = user.txtPolicyExpiry
    }
    
}
