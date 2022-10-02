//
//  OnboardingView.swift
//  Restart
//
//  Created by Ashwani Kumar on 29/09/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingIsActive = true
    @State private var buttonOffet: CGFloat = 0
    @State private var buttonWidth = UIScreen.main.bounds.width - 40
    @State private var isAnimating = false
    var hapticGenerator = UINotificationFeedbackGenerator()

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - Header Section
                HeaderView() //: HEADER
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                Spacer()
                
                // MARK: - Center Section
                HomeCenterView() //: CENTER
                
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
                        Capsule().fill(Color("ColorRed")).frame(width: buttonOffet + 80, alignment: .center)
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
                            .offset(x: buttonOffet)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        if gesture.translation.width > 0 && gesture.translation.width <= buttonWidth - 80 {
                                            buttonOffet = gesture.translation.width
                                            print("ashwani \(buttonOffet)")
                                        }
                                    })
                                    .onEnded({ gesture in
                                        if gesture.translation.width < buttonWidth / 2 {
                                            buttonOffet = 0
                                        } else {
                                            buttonOffet = buttonWidth - 80
                                            withAnimation {
                                                hapticGenerator.notificationOccurred(.success)
                                                isOnboardingIsActive = false
                                                playAudio(sound: "chimeup", type: "mp3")
                                            }
                                           
                                        }
                                    })
                            )
                        Spacer()
                    }
                    
                }.frame(height: 80, alignment: .center).padding()
                
                
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct HeaderView: View {
    var body: some View {
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
        }
    }
}

struct HomeCenterView: View {
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    var body: some View {
        ZStack {
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                .offset(x: imageOffset.width * -1)
                .blur(radius: abs(imageOffset.width / 5))
                .animation(.easeOut(duration: 1), value: imageOffset)
            Image("character-1")
                .resizable()
                .scaledToFit()
                .animation(.easeOut(duration: 1), value: isAnimating)
            
                .offset(x: imageOffset.width * 1.2)
                .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        print(gesture.translation
                        )
                        if gesture.translation.width <= 150 && gesture.translation.width >= -150 {
                            imageOffset = gesture.translation
                        }
                        
                    })
                    .onEnded({ _ in
                        withAnimation {
                            imageOffset = .zero
                        }
                       
                    })
                )
        }
        .onAppear {
            isAnimating = true
        }
    }
}
