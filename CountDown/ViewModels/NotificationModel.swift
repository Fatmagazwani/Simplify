//
//  NotificationModel.swift
//  CountDown
//
//  Created by Fatma Gazwani on 18/06/1444 AH.
//
import Foundation
import UserNotifications

class NotificationModel{
    
    func askPermission(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }

    func sendNotification(for reminder: Event) {
        guard let name = reminder.name,
              let duedate = reminder.duedate,
              let id = reminder.reminderID?.uuidString
        else {
            return
        }

        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: duedate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // Customise the content
        let content = UNMutableNotificationContent()
        content.title = name
        content.body = "" // TODO: Think of something to fill that as well
        content.sound = UNNotificationSound.default

        // Create the request
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UserNotifications.UNUserNotificationCenter.current().add(request)
    }

    func deletePendingNotification(for reminder: Event) {
        guard let reminderID = reminder.reminderID?.uuidString else {
            return
        }

        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [reminderID])
    }
}
