//
//  AllAccountView.swift
//  CapitalOne
//
//  Created by Kaitlyn Ellis on 7/11/24.
//

import Foundation
import SwiftUI

struct AllAccountView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
            })
            {
                Text("View Accounts")
                    .font(.title2)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .blue, radius: 5, x: 0, y: 5)
            }
            
            Button(action: {
                // Handle connect external accounts action
            }) {
                Text("Connect External Accounts")
                    .font(.title2)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.7), Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .red, radius: 5, x: 0, y: 5)
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(15)
        .shadow(color: .gray, radius: 10, x: 0, y: 5)
        .padding()
    }
}

struct AllAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AllAccountView()
    }
}
