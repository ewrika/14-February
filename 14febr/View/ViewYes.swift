//
//  ViewYes.swift
//  14febr
//
//  Created by Георгий Борисов on 11.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ViewYes:View{
    @State var isAnimating = true
    @State var No = CGFloat(0)
    @State var isShowedBack = false
    @State var avatarImage: Image
    var body:some View{
        ZStack {
            
            AnimatedImage(name:"gif4.gif",isAnimating:$isAnimating)
                .resizable()
            
                .ignoresSafeArea()
            
            
            VStack{
                AnimatedImage(name:"marry.gif",isAnimating:$isAnimating)
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    Text("february 14")
                        .font(Font.custom("Metamorve", size: 44))
                        .foregroundStyle(.red)
                    
                }
                
                VStack{
                     Image("photohere")
                          .resizable()
                          .scaledToFit()
                        .frame(width: 350,height: 350)
                    Spacer()
                    Button("Передумать"){
                        
                        isShowedBack.toggle()
                    }
                        .padding()
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
                }.fullScreenCover(isPresented:$isShowedBack){
                    ContentView()
                }
                
                
            }
        }
    }
}
#Preview {
    ViewYes(avatarImage: Image("photohere"))
}
