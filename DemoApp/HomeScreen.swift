//
//  HomeScreen.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

struct HomeScreen: View {
    
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Car.car_id, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Car>
    
    @Environment(\.managedObjectContext) private var viewContext
        
    @State private var items: [Car] = []
    @State private var selectedCar: Car = Car()
    
    @State private var isPresentedCarDetailsScreen = false
    
    var body: some View {
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
                    .padding(.trailing, 12)
                
                NavigationLink {
                    MyProfileScreen()
                } label: {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("John Doe")
                            .fontModifier(
                                font: .InterBold,
                                size: 18,
                                color: .black212B36
                            )
                        
                        HStack(spacing: 12) {
                            Text("Alcon Molina 49")
                                .fontModifier(
                                    font: .InterMedium,
                                    size: 12,
                                    color: .gray8B9AAE
                                )
                            
                            Image(systemName: "chevron.down")
                                .font(.system(
                                    size: 16,
                                    weight: .medium,
                                    design: .rounded
                                ))
                                .foregroundColor(Color(.gray8B9AAE))
                        }
                        
                    }
                }
                
                Spacer(minLength: 16)
                
                Image(.notification)
                    .resizable()
                    .frame(width: 16.8, height: 19.2)
            }
            .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Upcoming Appointment")
                    .fontModifier(
                        font: .InterBold,
                        size: 13,
                        color: .blueE1F0F6
                    )
                    .padding(.bottom, 8)
                
                HStack(spacing: 0) {
                    VStack(spacing: 3) {
                        Text("30")
                            .fontModifier(
                                font: .InterBold,
                                size: 18,
                                color: .blue4E647D
                            )
                        
                        Text("SEPT")
                            .fontModifier(
                                font: .InterBold,
                                size: 18,
                                color: .blue4E647D
                            )
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10.5)
                    .background() {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.blueE1F0F6))
                    }
                    .padding(.trailing, 12)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("Regular Car wash")
                            .fontModifier(
                                font: .InterBold,
                                size: 18,
                                color: .whiteFFFFFF
                            )
                        
                        HStack(spacing: 4) {
                            Text("Saturday")
                                .fontModifier(
                                    font: .InterMedium,
                                    size: 12,
                                    color: .blueCCDFEB
                                )
                            
                            Divider()
                                .frame(width: 2, height: 16)
                                .overlay(Color(.blueCCDFEB))
                            
                            Text("Peugeot 3008")
                                .fontModifier(
                                    font: .InterMedium,
                                    size: 12,
                                    color: .blueCCDFEB
                                )
                        }
                    }
                    
                    Spacer(minLength: 16)
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background() {
                Image(.bannerBg)
                    .resizable()
            }
            .padding(.bottom, 20)
            
            Text("My Car")
                .fontModifier(
                    font: .InterBold,
                    size: 18,
                    color: .black212B36
                )
                .padding(.bottom, 8)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 15) {
                    ForEach(items) { car in
                        CarListView(car: car)
                            .onTapGesture {
                                selectedCar = car
                                isPresentedCarDetailsScreen = true
                            }
                    }
                }
            }
            
            Spacer(minLength: 16)
        }
        .padding(.horizontal, 20)
        .background() {
            Color(.blueE1F0F6).ignoresSafeArea(edges: .all)
        }
        .sheet(isPresented: $isPresentedCarDetailsScreen) {
            CarDetailsScreen(car: $selectedCar)
                .padding(.top, 16)
                .presentationDetents([.fraction(0.9)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(26)
        }
        .onAppear() {
            fetchItems()
        }
    }
    
    private func fetchItems() {
        items = CoreDataHelper.shared.fetch(Car.self)
    }
}

#Preview {
    NavigationView {
        HomeScreen()
    }
}
