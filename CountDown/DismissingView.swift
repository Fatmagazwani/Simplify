//
//  DismissingView.swift
//  CountDown
//
//  Created by Fatma Gazwani on 16/06/1444 AH.
//

import SwiftUI

struct DismissingView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss Me") {
            dismiss()
        }.frame(width: 100, height: 20)
    }
}

struct DismissingView_Previews: PreviewProvider {
    static var previews: some View {
        DismissingView()
    }
}
