//
//  ContentView.swift
//  14febr
//
//  Created by Георгий Борисов on 11.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var  isShowedView = false
    @State var isLocked = false
    @State var isAnimating = true
    @State var Oups = CGFloat(0)
    var body: some View {
        
        ZStack {
            AnimatedImage(name:"gif4.gif",isAnimating:$isAnimating)
                .resizable()
                .ignoresSafeArea()
            VStack{
                AnimatedImage(name:"emo.gif",isAnimating:$isAnimating)
                    .resizable()
                    .frame(width: 390, height: 250)
                Spacer()
            }
            
            VStack{
                Spacer()
                Text("Will you marry me?")
                    .font(Font.custom("Metamorve", size: 44))
                    .foregroundStyle(.red)
                    
                
                HStack{
                    
                    Button{
                        isShowedView.toggle()
                    }label:{
                        Image(systemName: "heart.fill")
                    }
                    .padding()
                    .background(Color.red)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -6)
                    
                    
                    Button {
                        AudioServicesPlaySystemSound(1026)
                        isLocked.toggle()
                        withAnimation {
                            Oups=1
                        }
                    } label:{
                        Image(systemName: "heart.slash.fill")
                    }
                    .padding()
                    .background(Color.red)
                    .clipShape(Capsule())
                    .opacity(isLocked ? 0.0 : 1.0)
                
                }.padding()
                
                VStack(){
                    AnimatedImage(name:"gif2.gif",isAnimating:$isAnimating)
                        .resizable()
                        .frame(width: 250, height: 250)
                }.opacity(Oups)
            
            }
            
        }.fullScreenCover(isPresented:$isShowedView){
            ViewYes(avatarImage: Image("phothere"))
        }
      
        
        
        
        
    }
}


#Preview {
    ContentView()
}



