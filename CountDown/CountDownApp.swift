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
//                AddingEvents()
//                LoadingView().environment(\.managedObjectContext, persistentContainer.viewContext)
//                OnbordingView()
                Event1().environment(\.managedObjectContext, persistentContainer.viewContext)
//                CircularTimer()
            }
        }
    }
}
