//
//  CarDetailsScreen.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

struct CarDetailsScreen: View {
    
    @Binding var car: Car
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Image(car.thumbnail_path!)
                        .resizable()
                        .padding(.horizontal, 40)
                        .frame(height: 130)
                        .padding(.top, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            
                            ForEach(0..<5) { i in
                                Image(car.thumbnail_path!)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 8)
                                    .frame(width: 80, height: 60)
                                    .background() {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(.blueCCDFEB))
                                    }
                                    .padding(.leading, (i == 0) ? 20 : 0)
                                    .padding(.trailing, (i == 4) ? 20 : 0)
                            }
                        }
                    }
                    .frame(height: 60)
                    .padding(.bottom, 20)
                    .padding(.top, 9)
                }
                .frame(maxWidth: .infinity)
                .background() {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.blueF4F8FB))
                }
                .padding(.bottom, 12)
                
                HStack(spacing: 0) {
                    Text(car.car_name!)
                        .fontModifier(
                            font: .InterSemiBold,
                            size: 24,
                            color: .black212B36
                        )
                        .padding(.trailing, 5)
                    
                    Image(.certified)
                        .resizable()
                        .frame(width: 18.66, height: 23.55)
                    
                    Spacer(minLength: 16)
                    
                    Text(car.transmission!)
                        .fontModifier(
                            font: .InterSemiBold,
                            size: 12,
                            color: .blue4E647D
                        )
                        .padding(8)
                        .background() {
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color(.blueE1F0F6))
                        }
                }
                
                Divider()
                    .frame(height: 2)
                    .overlay(Color(.grayDAE3F0))
                    .padding(.vertical, 15)
                
                VStack(spacing: 15) {
                    HStack(spacing: 0) {
                        CarDetailsInfoView(
                            icon: .calender,
                            title: "Year",
                            value: car.manufactur_year!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CarDetailsInfoView(
                            icon: .speedMeter,
                            title: "Km",
                            value: car.km_driven!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: 0) {
                        CarDetailsInfoView(
                            icon: .fire,
                            title: "Fuel type",
                            value: car.fuel_type!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CarDetailsInfoView(
                            icon: .icCar,
                            title: "Body type",
                            value: car.body_type!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: 0) {
                        CarDetailsInfoView(
                            icon: .gearShift,
                            title: "Transmission",
                            value: car.transmission!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CarDetailsInfoView(
                            icon: .licensePlate,
                            title: "Tuition",
                            value: car.tuition!
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.bottom, 35)
                
                Text("Policy Details")
                    .fontModifier(
                        font: .InterBold,
                        size: 16,
                        color: .black212B36
                    )
                    .padding(.bottom, 8)
                
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("DNI No.")
                            .fontModifier(
                                font: .InterMedium,
                                size: 12,
                                color: .gray8B9AAE
                            )
                        
                        Text(car.din_no!)
                            .fontModifier(
                                font: .InterSemiBold,
                                size: 15,
                                color: .black212B36
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Expiry Date")
                            .fontModifier(
                                font: .InterMedium,
                                size: 12,
                                color: .gray8B9AAE
                            )
                        
                        Text(car.din_no_expiry_date!)
                            .fontModifier(
                                font: .InterSemiBold,
                                size: 15,
                                color: .black212B36
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                
                Spacer(minLength: 16)
            }
            .padding(20)
        }
    }
}

private struct CarDetailsInfoView: View {
    
    let icon: ImageResource
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .fontModifier(
                        font: .InterMedium,
                        size: 12,
                        color: .gray8B9AAE
                    )
                
                Text(value)
                    .fontModifier(
                        font: .InterSemiBold,
                        size: 15,
                        color: .black212B36
                    )
            }
        }
    }
}

//#Preview {
//    CarDetailsScreen()
//}
