//
//  DateFile.swift
//  CountDown
//
//  Created by Fatma Gazwani on 19/06/1444 AH.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel : ObservableObject {
        
    let container : NSPersistentContainer
    @Published var savedEntities: [Event] = []
    
    let notify = NotificationModel()
    
    init() {
        // loading the container inside init and printing the error
        // provide the name of the container
        container = NSPersistentContainer(name: "CountDownData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data : \(error)")
            } else {
                // this else statement can be removed once the core data is loaded successfully.
                print("Successfully loaded Core Data!")
            }
        }
        
        fetchReminders()
    }
    
    func fetchReminders(){
        
        let request = NSFetchRequest<Event>(entityName: "Event")

        do{
            savedEntities = try container.viewContext.fetch(request)
        } catch{
            print("Error fetching items from CoreData : \(error)")
        }
    }
    
    // both text and reminderString will be passed from the mainview and will be stored as title and dateandtime in CoreData
    func addReminder(title: String, date: Date) {
        let newReminder = Event(context: container.viewContext)
        newReminder.name = title
        newReminder.duedate = date
        newReminder.reminderID = UUID()
        saveData()

        notify.sendNotification(for: newReminder)
    }
    
    func saveData(){
        
        do{
            try container.viewContext.save()
            fetchReminders()
            
        } catch let error{
            print("Error saving data : \(error)")
        }
        
    }
    
    
    // deleting items from CoreData
    func deleteReminder(indexSet : IndexSet){
        // first we need to find the entity that is at this indexSet. An IndexSet could have a bunch of indices, but we know when we swipe on a cell, its just one index.
        guard let index = indexSet.first else { return }

        let entity = savedEntities[index]
        notify.deletePendingNotification(for: entity)
        container.viewContext.delete(entity)
        saveData()
    }
}
