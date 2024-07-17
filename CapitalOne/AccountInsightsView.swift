//
//  AccountInsightsView.swift
//  CapitalOne
//
//  Created by Kaitlyn Ellis on 7/11/24.
//


import Foundation

import SwiftUI

struct AccountInsightsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Text("Credit Overview")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()

                // Credit Limit Section
                Section(header: Text("Credit Limit")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading)
                            .padding(.top)) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Stay on track to unlock your credit limit increases")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("Current Credit Limit: $10,000")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                        Text("Current Credit Score: 718")
                            .foregroundColor(Color.red)
                            .fontWeight(.bold)
                        Text("Next Potiental Limit: $11,500")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color(red: 0.1, green: 0.1, blue: 0.3)) // Muted dark blue background
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }

                // Payment History Section
                Section(header: Text("Payment History")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading)
                            .padding(.top)) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Times You've Paid On Time:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], id: \.self) { month in
                                    VStack {
                                        Image(systemName: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"].contains(month) ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(["Jan", "Feb", "Mar", "Apr", "May", "Jun"].contains(month) ? .red : .gray)
                                        Text(month)
                                            .foregroundColor(.gray)
                                            .font(.footnote)
                                    }
                                    .padding(.horizontal, 5)
                                }
                            }
                        }
                        Text("Pay at least 15% of your monthly statement balance or your minimum, whichever is more.")
                            .foregroundColor(.gray)
                        Text("More On Time Payments = Higher Credit Score = Higher Chance For Limit Increase!")
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .background(Color(red: 0.1, green: 0.1, blue: 0.3)) // Muted dark blue background
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding(.top)
            .background(Color(red: 0.1, green: 0.1, blue: 0.3).edgesIgnoringSafeArea(.all)) // Muted dark blue background
        }
    }
}

struct AccountInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInsightsView()
    }
}
