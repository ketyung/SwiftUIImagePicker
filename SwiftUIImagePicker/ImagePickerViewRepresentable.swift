//
//  ImagePickerViewRepresentable.swift
//  SwiftUIImagePicker
//
//  Created by Christopher Chee on 05/01/2024.
//
import SwiftUI

struct ImagePickerViewRepresentable: UIViewControllerRepresentable {
    // Implement necessary coordinator if required for delegate handling

    @Binding var selectedImage: UIImage?
    
    @Environment(\.presentationMode) var isPresented
    
    func makeCoordinator() -> Coordinator {
            return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true // Example: Allow image editing
        // Additional configuration for source type, etc.
        picker.sourceType = .photoLibrary // Change this to .camera for camera access
            
                // Additional configuration if needed, e.g., limiting to images only
        picker.mediaTypes = ["public.image"]
        
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Update the view controller if needed
    }

    // Implement Coordinator if handling delegate methods
    // ...
}


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: ImagePickerViewRepresentable
    
    init(_ parent: ImagePickerViewRepresentable) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            parent.selectedImage = image
        }
        parent.isPresented.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isPresented.wrappedValue.dismiss()
    }
}
