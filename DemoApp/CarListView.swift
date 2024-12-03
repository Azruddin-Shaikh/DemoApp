//
//  CarListView.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

struct CarListView: View {
    
    let car: Car
    
    var body: some View {
        VStack(spacing: 0) {
            Image(car.thumbnail_path!)
                .resizable()
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, maxHeight: 130)
                .background() {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.blueF4F8FB))
                }
                .padding(.bottom, 12)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 0) {
                    Text(car.car_name!)
                        .fontModifier(
                            font: .InterSemiBold,
                            size: 15,
                            color: .black212B36
                        )
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
                
                Text(car.modal_name!)
                    .fontModifier(
                        font: .InterMedium,
                        size: 15,
                        color: .blue4E647D
                    )
                
                HStack(spacing: 6) {
                    Text(car.fuel_type!)
                        .fontModifier(
                            font: .InterMedium,
                            size: 12,
                            color: .gray8B9AAE
                        )
                    
                    Divider()
                        .frame(width: 2, height: 20)
                        .overlay(Color(.grayDAE3F0))
                    
                    Text(car.manufactur_year!)
                        .fontModifier(
                            font: .InterMedium,
                            size: 12,
                            color: .gray8B9AAE
                        )
                }
            }
        }
        .padding(16)
        .background() {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.whiteFFFFFF))
        }
    }
}

//#Preview {
//    CarListView()
//}
