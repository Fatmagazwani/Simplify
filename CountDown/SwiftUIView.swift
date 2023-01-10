//
//  SwiftUIView.swift
//  CountDown
//
//  Created by Fatma Gazwani on 17/06/1444 AH.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(Date.now, format: .dateTime.month())
    }
}
func trivialExample () {
    let components = Calendar.current.dateComponents ([.hour], from: Date.now)
    let month = components.month ?? 0
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
