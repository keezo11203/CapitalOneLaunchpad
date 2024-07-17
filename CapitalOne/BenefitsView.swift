//
//  BenefitsView.swift
//  CapitalOne
//
//  Created by Kaitlyn Ellis on 7/11/24.
//

import Foundation
import SwiftUI

struct BenefitsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Text("Your Benefits")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()

                // Benefit Cards
                VStack(spacing: 15) {
                    BenefitCard(
                        icon: "airplane",
                        title: "Luxury Travel Perks",
                        description: "Enjoy exclusive discounts and upgrades on flights and hotels, plus complimentary access to premium airport lounges worldwide."
                    )
                    
                    BenefitCard(
                        icon: "ticket",
                        title: "Exclusive Event Access",
                        description: "Receive invitations to exclusive events and experiences."
                    )
                    
                    BenefitCard(
                        icon: "dollarsign.circle",
                        title: "Cashback Rewards",
                        description: "Earn higher cashback rates on dining, groceries, and online shopping."
                    )
                    
                    BenefitCard(
                        icon: "play.tv",
                        title: "Streaming Services",
                        description: "Get access to popular streaming services for free or a discounted rate."
                    )
                    
                    BenefitCard(
                        icon: "shield.fill",
                        title: "Extra Protection",
                        description: "Benefit from enhanced security features, including fraud detection and purchase protection."
                    )
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
            .background(Color(red: 0.1, green: 0.1, blue: 0.3).edgesIgnoringSafeArea(.all)) // Muted dark blue background
        }
        .navigationBarItems(leading: Button(action: {
            // Action to go back
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .clipShape(Circle())
                .shadow(radius: 10)
        })
    }
}

struct BenefitCard: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: icon)
                .foregroundColor(.red)
                .font(.largeTitle)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(description)
                    .foregroundColor(.gray)
                    .font(.body)
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 0.1, green: 0.1, blue: 0.3))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct BenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        BenefitsView()
    }
}
