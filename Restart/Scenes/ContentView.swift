//
//  ContentView.swift
//  Restart
//
//  Created by Ashwani Kumar on 29/09/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingIsActive = true
    var body: some View {
        ZStack {
            if isOnboardingIsActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
