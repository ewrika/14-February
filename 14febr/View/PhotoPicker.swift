//
//  PhotoPicker.swift
//  14febr
//
//  Created by Георгий Борисов on 12.02.2024.
//

import SwiftUI

struct PhotoPicker: View {
    @State var image = UIImage(systemName: "photo")!
    @State var isPickerShow = false
    var body: some View {
        ZStack(alignment:Alignment(horizontal: .trailing, vertical: .bottom)){
            Image(uiImage:image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .clipped()
                .cornerRadius(20)
            
            ZStack{
                
                Button{
                    isPickerShow.toggle()
                }label:{
                    ZStack{
                        Circle()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.pink)
                            .overlay(
                                RoundedRectangle(cornerRadius:25)
                                .stroke(Color.white,lineWidth: 3)
                            )
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                    }.offset(x:10,y:10)
                        .sheet(isPresented: $isPickerShow) {
                            ImagePicker(image: $image)
                        }

                }
            }
        }
    }
}
#Preview {
    PhotoPicker()
}
