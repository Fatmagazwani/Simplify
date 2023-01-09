//
//  CountDownWidgetBundle.swift
//  CountDownWidget
//
//  Created by Fatma Gazwani on 15/06/1444 AH.
//

import WidgetKit
import SwiftUI

@main
struct CountDownWidgetBundle: WidgetBundle {
    var body: some Widget {
        CountDownWidget()
        CountDownWidgetLiveActivity()
    }
}
