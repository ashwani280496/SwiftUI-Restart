//
//  OnboardingView.swift
//  Restart
//
//  Created by Ashwani Kumar on 29/09/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingIsActive = true

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - Header Section
                VStack {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10.0)
                } //: HEADER
                Spacer()
                
                // MARK: - Center Section
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                
                Spacer()
                
                // MARK: - Footer Section
                
                ZStack {
                    //Parts of the custom button
                    
                    //1 . Background
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2)).padding(8)
                    //2. actio  text
                    
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                        
                    //3.Capsule
                    
                    HStack{
                        Capsule().fill(Color("ColorRed")).frame(width: 80, alignment: .center)
                        Spacer()
                    }
                    //4. Circle (dragable)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                        }.foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .onTapGesture {
                                isOnboardingIsActive = false
                            }
                        Spacer()
                    }
                    
                }.frame(height: 80, alignment: .center).padding()
                
                
            } //: VSTACK
        } //: ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
