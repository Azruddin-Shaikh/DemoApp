//
//  MyProfileScreen.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

struct MyProfileScreen: View {
    
    let email: String = "johndoe@gmail.com"
    
    @StateObject private var observer = MyProfileObserver()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var user = UserModal()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(
                            size: 20,
                            weight: .heavy,
                            design: .rounded
                        ))
                        .foregroundColor(Color(.blue4E647D))
                }
                
                Spacer(minLength: 16)
                
                Text("My Profile")
                    .fontModifier(
                        font: .InterBold,
                        size: 20,
                        color: .black212B36
                    )
                Spacer(minLength: 16)
                
                Image(.icEdit)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Image(.avatar)
                            .resizable()
                            .frame(width: 19.2, height: 19.2)
                            .padding(8.4)
                            .background() {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.blue337FA3))
                            }
                            .padding(.trailing, 16)
                        
                        VStack(alignment:.leading, spacing: 0) {
                            Group {
                                Text(user.firstName ?? "F NAME")
                                    .fontModifier(
                                        font: .InterSemiBold,
                                        size: 26,
                                        color: .black212B36
                                    )
                                +
                                Text(" \(user.lastName ?? "L NAME")")
                                    .fontModifier(
                                        font: .InterMedium,
                                        size: 26,
                                        color: .black212B36
                                    )
                            }
                            
                            Text(user.email ?? "EMAIL")
                                .fontModifier(
                                    font: .InterMedium,
                                    size: 15,
                                    color: .blue337FA3
                                )
                        }
                    }
                    .padding(.bottom, 23)
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 15) {
                            MyProfileTextFeildView(
                                lable: "Telephone",
                                text: $observer.tfTelephone
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            MyProfileTextFeildView(
                                lable: "Date of Birth",
                                text: $observer.tfDob
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        MyProfileTextFeildView(
                            lable: "Address",
                            text: $observer.tfAddress
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            MyProfileTextFeildView(
                                lable: "DNI No.",
                                text: $observer.tfDINExpiry
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            MyProfileTextFeildView(
                                lable: "Expiry Date",
                                text: $observer.tfDINExpiry
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        HStack(spacing: 15) {
                            MyProfileTextFeildView(
                                lable: "License No.",
                                text: $observer.tfLicenseno
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            MyProfileTextFeildView(
                                lable: "Expiry Date",
                                text: $observer.tfLicenseExpiry
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        MyProfileTextFeildView(
                            lable: "Billing Address",
                            text: $observer.tfBillingAddress
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            MyProfileTextFeildView(
                                lable: "Policy No.",
                                text: $observer.tfPolicyno
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            MyProfileTextFeildView(
                                lable: "Expiry Date",
                                text: $observer.tfPolicyExpiry
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        MyProfileTextFeildView(
                            lable: "Type of Purchase",
                            text: $observer.tfTypeOfPurchase
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(16)
                    .background() {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.whiteFFFFFF))
                    }
                    .padding(.bottom, 16)
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Password")
                                .fontModifier(
                                    font: .InterMedium,
                                    size: 12,
                                    color: .gray8B9AAE
                                )
                            
                            SecureField("", text: $observer.tfPassword)
                                .font(
                                    .custom(
                                        FontStyle.InterMedium.rawValue,
                                        fixedSize: 15
                                    )
                                )
                                .foregroundColor(Color(.black212B36))
                        }
                        Spacer(minLength: 16)
                        
                        Button {
                            
                        } label: {
                            Text("Change")
                                .fontModifier(
                                    font: .InterBold,
                                    size: 15,
                                    color: .blue337FA3
                                )
                        }
                    }
                    .padding(16)
                    .background() {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.whiteFFFFFF))
                    }
                    
                    
                    Spacer(minLength: 16)
                    
                    Button {
                        
                    } label: {
                        Text("Delete Account")
                            .fontModifier(
                                font: .InterMedium,
                                size: 15,
                                color: .redD93E3E
                            )
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                    }
                    .background() {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.whiteFFFFFF))
                    }
                }
                .padding(.top, 19)
            }

        }
        .padding(.horizontal, 20)
        .background() {
            Color(.blueE1F0F6).ignoresSafeArea(edges: .all)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

private struct MyProfileTextFeildView: View {
    
    let lable: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(lable)
                .fontModifier(
                    font: .InterMedium,
                    size: 12,
                    color: .gray8B9AAE
                )
                .padding(.bottom, 3)
            
            TextField("", text: $text)
                .font(
                    .custom(
                        FontStyle.InterMedium.rawValue,
                        fixedSize: 15
                    )
                )
                .foregroundColor(Color(.black212B36))
                .padding(.bottom, 8)
            
            Divider()
                .frame(height: 1)
                .overlay(Color(.grayDAE3F0))
        }
        .disabled(true)
    }
}

#Preview {
    MyProfileScreen()
}
