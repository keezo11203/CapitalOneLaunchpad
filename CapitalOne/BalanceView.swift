//
//  BalanceView.swift
//  CapitalOne
//
//  Created by Kaitlyn Ellis on 7/11/24.
//

import Foundation
import SwiftUI

struct BalanceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Current Balance: $1,249.47")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            ProgressBar(value: 1249.47 / 10000.0)
                .frame(height: 10)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Available Credit: $8,750.53")
                Text("Total Credit Line: $10,000")
            }
            .foregroundColor(Color.white)
            
            Text("Last Statement Balance:\n$718.39 on 06/06/2024")
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("View Billing Statement PDF")
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                        // Handle PDF view action
                    }
                
                Text("View Activity & Statements")
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                        // Handle Activity & Statements view action
                    }
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .background(Color(red: 0.1, green: 0.1, blue: 0.3)) // Muted dark blue background
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}


struct ProgressBar: View {
    var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.red)
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
    }
}
