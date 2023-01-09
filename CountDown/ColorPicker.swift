//
//  ColorPicker.swift
//  CountDown
//
//  Created by Fatma Gazwani on 11/06/1444 AH.
//

import SwiftUI

struct ColorPicker: View {
    @State private var selectedColor: Color = .blue
    var body: some View {
        VStack(alignment: .center) {
            
            MyColorPicker(selectedColor: $selectedColor)
            

        }.padding()
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker()
    }
}
