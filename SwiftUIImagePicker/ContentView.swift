//
//  ContentView.swift
//  SwiftUIImagePicker
//
//  Created by Christopher Chee on 05/01/2024.
//

import SwiftUI
struct ContentView: View {
    
    @State private var isImagePickerPresented = false
    
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack(spacing:10) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            Button("Select Image") {
                selectedImage = nil
                isImagePickerPresented = true
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerViewRepresentable(selectedImage: $selectedImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
