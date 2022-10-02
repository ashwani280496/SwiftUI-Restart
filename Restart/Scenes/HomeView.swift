//
//  HomeView.swift
//  Restart
//
//  Created by Ashwani Kumar on 29/09/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingIsActive = false
    @State private var isAnimating = false
    var hapticGenerator = UINotificationFeedbackGenerator()


    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Header
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 3).repeatForever(), value: isAnimating)
            }
            
            Text("The time leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button {
                withAnimation {
                    hapticGenerator.notificationOccurred(.warning)
                    playAudio(sound: "success", type: "m4a")
                    isOnboardingIsActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
