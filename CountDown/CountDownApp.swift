//
//  CountDownApp.swift
//  CountDown
//
//  Created by Fatma Gazwani on 11/06/1444 AH.
//

import SwiftUI

@main
struct CountDownApp: App {
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
//                LoadingView()
                Event1().environment(\.managedObjectContext, persistentContainer.viewContext)
            }
        }
    }
}
