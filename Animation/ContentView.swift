//
//  ContentView.swift
//  Animation
//
//  Created by Kübra Cennet  on 8.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldAnimate = false
    
    @State var leftOffest: CGFloat = -100
    @State var rightOffest: CGFloat = 100
    
    let timer = Timer.publish(every: 1.6, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Section {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .offset(x: leftOffest)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1))
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .offset(x: leftOffest)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .offset(x: leftOffest)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.4))
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .offset(x: leftOffest)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.6))
                }.onReceive(timer) { (_) in
                    swap(&self.leftOffest, &self.rightOffest)
                    
                }
            }.padding(.bottom, 60)
          //second animation
            
            Section {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 110, height: 15)
                    .offset(x: shouldAnimate ? 100 : -100)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            }
            Spacer()
            
            Section {
                HStack(alignment: .center, spacing: shouldAnimate ? 15 : 5) {
                    Capsule(style: .continuous)
                        .fill(Color.orange)
                        .frame(width: 10, height: 50)
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 30)
                    Capsule(style: .continuous)
                        .fill(Color.green)
                        .frame(width: 10, height: 50)
                    Capsule(style: .continuous)
                        .fill(Color.red)
                        .frame(width: 10, height: 30)
                    Capsule(style: .continuous)
                        .fill(Color.gray)
                        .frame(width: 10, height: 50)
                    Capsule(style: .continuous)
                        .fill(Color.purple)
                        .frame(width: 10, height: 30)
                    Capsule(style: .continuous)
                        .fill(Color.pink)
                        .frame(width: 10, height: 50)
                }
                .frame(width: shouldAnimate ? 150 : 100)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                Spacer()
                
                Section {
                    HStack {
                        Circle()
                            .fill(Color.brown)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                        Circle()
                            .fill(Color.brown)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
                        Circle()
                            .fill(Color.brown)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                    }
                }
                Spacer()
                
                Section {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                        .offset(x: rightOffest)
                        .opacity(0.8)
                        .animation(Animation.easeInOut(duration: 1))
                 }
                Spacer()

            }
        }.onAppear {
            self.shouldAnimate = true
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
