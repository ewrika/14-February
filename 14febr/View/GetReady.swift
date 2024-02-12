//
//  GetReady.swift
//  14febr
//
//  Created by Георгий Борисов on 12.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct GetReady: View {
    @State var  isShowedView = false
    @State var isAnimating = true
    @State var isShowedBack = false
    @Binding var avatarImage : Image
   // @Binding private var avatarImage
   // @Binding var image
    var body:some View{
        ZStack {
            // background
            AnimatedImage(name:"gif4.gif",isAnimating:$isAnimating)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack{
                
                VStack{
                    
                    Text("select family photo")
                        .font(Font.custom("Metamorve", size: 44))
                        .foregroundStyle(.red)
                    
                }
                
                VStack{
                    Spacer()
                    ZStack{
                        
                     //   Image("photohere")
                     //       .resizable()
                     //       .scaledToFit()
                      //      .frame(width: 350,height: 350)
                        Test()
                    }
                    Spacer()
            
                    Button("Ready"){
                        isShowedView.toggle()
                        
                    }.font(Font.custom("Metamorve", size: 44))
                        .foregroundStyle(.black)

                        .padding()
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
                }.fullScreenCover(isPresented:$isShowedView){
                    ContentView()
                }
                
                
            }
        }
    }
}

#Preview {
    GetReady(avatarImage: .constant(Image("photohere")))
}
