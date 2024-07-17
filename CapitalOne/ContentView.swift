//
//  ContentView.swift
//  CapitalOne
//
//  Created by Kaitlyn Ellis on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showBenefits = false
    @State private var floating = false
    @State private var flipDegrees = 0.0
    @State private var offsetY: CGFloat = 0
    @State private var showMenu = false
    @State private var showBalanceView = false
    @State private var showAccountsView = false
    @State private var showInsightsView = false
    @State private var showBenefitsView = false

    var body: some View {
        ZStack {
            // Blue-to-Red Gradient Background
            BlueRedGradientBackground()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    if showBenefits || showBalanceView || showAccountsView || showInsightsView || showBenefitsView || showMenu {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                if showBalanceView || showAccountsView || showInsightsView || showBenefitsView {
                                    // Bring back to "View Your Infinite Possibilities"
                                    showBalanceView = false
                                    showAccountsView = false
                                    showInsightsView = false
                                    showBenefitsView = false
                                    showMenu = true
                                    offsetY = -1000
                                } else if showMenu {
                                    // Bring back to card
                                    showMenu = false
                                    offsetY = 0
                                } else {
                                    showBenefits = false
                                    flipDegrees = 0
                                }
                            }
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .padding(.leading, 20)
                        .padding(.top, 40)
                    }
                    Spacer()
                }
                Spacer()
                
                ZStack {
                    if !showBalanceView && !showAccountsView && !showInsightsView && !showBenefitsView && !showMenu {
                        // Front of the Card
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.blue)
                            .frame(width: 300, height: 200)
                            .shadow(radius: 10)
                            .overlay(
                                Text("Blue Infinity")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .opacity(showBenefits ? 0 : 1)
                            .rotation3DEffect(
                                .degrees(flipDegrees),
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .offset(y: floating ? -10 : 10)
                            .onAppear {
                                startFloatingAnimation()
                            }
                            .onTapGesture {
                                flipCard()
                            }
                        
                        // Back of the Card
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.blue)
                            .frame(width: 300, height: 200)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("View Your Infinite Possibilities")
                                        .font(.title)
                                        .padding()
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            withAnimation(.easeInOut(duration: 2)) {
                                                offsetY = -1000
                                                showMenu = true
                                            }
                                        }
                                }
                                .padding()
                                .foregroundColor(.black)
                            )
                            .opacity(showBenefits ? 1 : 0)
                            .rotation3DEffect(
                                .degrees(flipDegrees - 180),
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .offset(y: floating ? -10 : 10 + offsetY)
                            .onAppear {
                                startFloatingAnimation()
                            }
                            .onTapGesture {
                                flipCard()
                            }
                    }
                    
                    if showBalanceView {
                        BalanceView()
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut)
                    }
                    
                    if showAccountsView {
                        AllAccountView()
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut)
                    }
                    
                    if showInsightsView {
                        AccountInsightsView()
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut)
                    }
                    
                    if showBenefitsView {
                        BenefitsView()
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut)
                    }
                }
                .animation(.easeInOut(duration: 0.8), value: floating)
                
                Spacer()
            }
            .padding()
            
            // Hamburger Menu
            if showMenu && !showBalanceView && !showAccountsView && !showInsightsView && !showBenefitsView {
                VStack {
                    Spacer()
                    HamburgerMenu(showBalanceView: $showBalanceView, showMenu: $showMenu, showAccountsView: $showAccountsView, showInsightsView: $showInsightsView, showBenefitsView: $showBenefitsView)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
            }
        }
    }

    private func flipCard() {
        withAnimation {
            flipDegrees += 180
            showBenefits.toggle()
        }
    }

    private func startFloatingAnimation() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            floating.toggle()
        }
    }
}

struct BlueRedGradientBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color(red: 0.5, green: 0, blue: 0)]), startPoint: .top, endPoint: .bottom)

            GeometryReader { geometry in
                ForEach(0..<50) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: CGFloat.random(in: 2...4), height: CGFloat.random(in: 2...4))
                        .position(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        )
                }
            }
        }
    }
}

struct HamburgerMenu: View {
    @State private var showOptions = [false, false, false, false]
    @Binding var showBalanceView: Bool
    @Binding var showMenu: Bool
    @Binding var showAccountsView: Bool
    @Binding var showInsightsView: Bool
    @Binding var showBenefitsView: Bool

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<4) { index in
                MenuItem(index: index, showOptions: $showOptions, showBalanceView: $showBalanceView, showMenu: $showMenu, showAccountsView: $showAccountsView, showInsightsView: $showInsightsView, showBenefitsView: $showBenefitsView)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .shadow(color: .gray, radius: 10, x: 0, y: 5)
        .padding()
        .onAppear {
            for i in 0..<showOptions.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showOptions[i] = true
                    }
                }
            }
        }
    }
}

struct MenuItem: View {
    let index: Int
    @Binding var showOptions: [Bool]
    @Binding var showBalanceView: Bool
    @Binding var showMenu: Bool
    @Binding var showAccountsView: Bool
    @Binding var showInsightsView: Bool
    @Binding var showBenefitsView: Bool

    var body: some View {
        Group {
            if showOptions[index] {
                switch index {
                case 0:
                    Text("View Balance")
                        .font(.title2)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .blue, radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            withAnimation {
                                showBalanceView = true
                                showMenu = false
                            }
                        }
                case 1:
                    Text("View All Accounts")
                        .font(.title2)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.7), Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .red, radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            withAnimation {
                                showAccountsView = true
                                showMenu = false
                            }
                        }
                case 2:
                    Text("Account Insights")
                        .font(.title2)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .blue, radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            withAnimation {
                                showInsightsView = true
                                showMenu = false
                            }
                        }
                case 3:
                    Text("Benefits")
                        .font(.title2)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.7), Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .red, radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            withAnimation {
                                showBenefitsView = true
                                showMenu = false
                            }
                        }
                default:
                    EmptyView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
