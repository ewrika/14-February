//
//  Test.swift
//  14febr
//
//  Created by Георгий Борисов on 12.02.2024.
//

import SwiftUI
import PhotosUI


struct Test: View {
    @State private var avatarItem: PhotosPickerItem?
    @State var avatarImage: Image?
    var body: some View {
        VStack {
                PhotosPicker("Select Photo", selection: $avatarItem, matching: .images)
                .font(Font.custom("Metamorve", size: 44))
                .foregroundStyle(.black)
                .padding()
                .background(Color.red)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
                   avatarImage?
                       .resizable()
                       .scaledToFit()
                       .frame(width: 350, height: 350)
               }
               .onChange(of: avatarItem) {
                   Task {
                       if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                           avatarImage = loaded
                       } else {
                           print("Failed")
                       }
                   }
               }
    }
}

#Preview {
    Test()
}
