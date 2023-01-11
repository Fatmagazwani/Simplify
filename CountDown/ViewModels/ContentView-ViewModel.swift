////
////  ContentView-ViewModel.swift
////  CountDown
////
////  Created by Fatma Gazwani on 18/06/1444 AH.
////
//
//import Foundation
//import CoreData
//
//extension Events {
//    
//    @MainActor class ViewModel: ObservableObject {
//        
//        
//        @Environment(\.managedObjectContext) private var viewContext
//        @FetchRequest(entity: Event.entity(), sortDescriptors: [NSSortDescriptor(key: "duedate", ascending: true)]) private var allEvents: FetchedResults<Event>
//        
//        @Published var name: String = ""
//        @Published var duedate: String = ""
//        @Published var dueDate = Date()
//        
//        private func addEvent() {
//            print(allEvents)
//            do {
//                let event = Event(context: viewContext)
//                event.name = name
//                event.thecolor = ColorsPickers.rawValue
//                event.duedate = dueDate
//                try viewContext.save()
//            }catch{
//                print(error.localizedDescription)
//            }
//        }
//        
//        
//        private func deleteEvent (at offsets: IndexSet) {
//            offsets.forEach {
//                index in
//                let event = allEvents[index]
//                viewContext.delete(event)
//                do {
//                    try viewContext.save()
//                }catch{
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        
//        
//        @Published var ColorsPickers: BordersColor = .blue
//        
//        enum BordersColor: String, Identifiable, CaseIterable {
//            var id: UUID {
//                return UUID()
//            }
//            case red = "red"
//            case yellow = "yellow"
//            case orange = "orange"
//            case purple = "purple"
//            case blue = "blue"
//            case indigo = "indigo"
//            case green = "green"
//            case mint = "mint"
//        }
//        
//        extension BordersColor {
//            var title: String {
//                switch self {
//                case .red:
//                    return "Red"
//                case .yellow:
//                    return "Yellow"
//                case .orange:
//                    return "Orange"
//                case .purple:
//                    return "Purple"
//                case .blue:
//                    return "Blue"
//                case .indigo:
//                    return "Indigo"
//                case .green:
//                    return "Green"
//                case .mint:
//                    return "Mint"
//                    
//                }
//            }
//        }
//        
//        private func theSelectedColor(_ value: String) -> Color{
//            let  thecolor = BordersColor(rawValue: value)
//            
//            switch thecolor {
//            case .red:
//                return Color.red
//            case .yellow:
//                return Color.yellow
//            case .orange:
//                return Color.orange
//            case .purple:
//                return Color.purple
//            case .blue:
//                return Color.blue
//            case .indigo:
//                return Color.indigo
//            case .green:
//                return Color.green
//            case .mint:
//                return Color.mint
//            case .none:
//                return Color.blue
//            }
//        }
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//    }
//}
//
//
//
//
