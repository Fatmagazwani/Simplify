////
////  MyColorPicker.swift
////  MainProject
////
////  Created by Federico on 15/03/2022.
////
//
//import SwiftUI
//
//struct MyColorPicker: View {
//    @Binding var selectedColor: Color
//    private let colors:[Color] = [.red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint]
//    
//    var body: some View {
//        ScrollView(.vertical) {
//            
//            HStack {
//                ForEach(colors, id: \.self) { color in
//                    Circle()
//                        .foregroundColor(color)
//                        .frame(width: 30, height: 30)
//                        .scaleEffect(color == selectedColor ? 1.2 : 1.0)
//                        .onTapGesture {
//                            selectedColor = color
//                        }
//                }
//            }
//            .padding()
//
//        }
//    }
//}
//
//struct MyColorPicker_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        MyColorPicker(selectedColor: .constant(.blue))
//    }
//}
