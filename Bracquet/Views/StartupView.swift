//  StartupView.swift
//  Copyright Bracquet 2024
//
//  This parent view will serve as the first screen
//  users are greeted by when opening the Bracquet App.
//  Functionally, this view will allow users to proceed
//  to either logging in or signing up.
//
//  Created by Drew Curtin on 8/31/24.

import SwiftUI

struct StartupView: View {
    // Testing Closure below : Allows one to execute custom logic in test, which is
    // useful in ViewInspector unit testing of state based views. Used in conjunction
    // with onAppear handler below.
    internal var didAppear: ((Self) -> Void)?
    
    @State var navigateToLogin = false
    @State var navigateToSignup = false
    
    var body: some View {
        NavigationView() {
            ZStack() {
                Color(hex: BracquetColors.backgroundWhite.rawValue)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        HeaderView()
                            .padding(.bottom, -10)
                        
                        Text("The Official Tennis Tournament Challenge")
                            .font(Font.custom("Inter-SemiBold", size: 18))
                            .foregroundColor(Color(hex: BracquetColors.pureBlack.rawValue))
                            .lineLimit(1)
                    }
                    .frame(width: getCurrentScreenWidth())
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                    
                    Image("Tennis Stadium")
                        .resizable()
                        .scaledToFit()
                        .border(Color(hex: BracquetColors.accentBlack.rawValue), width: 5)
                        .frame(width: getMaximumViewWidth())
                        .padding(.bottom, 5)
                    
                    Text("Compete with friends, family, and tennis fanatics all over the world to see who can pick them the best!")
                        .font(Font.custom("Inter-Regular", size: 18))
                        .foregroundColor(Color(hex: BracquetColors.pureBlack.rawValue))
                        .lineLimit(3)
                        .frame(width: getMaximumViewWidth())
                        .padding(.bottom, 20)
                    
                    ButtonView(text: "Login", color: BracquetColors.primaryBlue) {
                        navigateToLogin = true
                    }
                    .padding(.bottom, 5)
                    
                    ButtonView(text: "Sign Up", color: BracquetColors.primaryGreen) {
                        navigateToSignup = true
                    }
                    .padding(.bottom, 30)
                    .onAppear { self.didAppear?(self) } // For unit testing
                    
                    Spacer()
                    
                    // These navigation links take up no space and are tied to the state
                    // variables manipulated by the button views
                    NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: SignupView(), isActive: $navigateToSignup) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
