////
////  Events.swift
////  CountDown
////
////  Created by Fatma Gazwani on 11/06/1444 AH.
////
//
//import SwiftUI
//import CoreData
//
//enum TheColor: String, Identifiable, CaseIterable {
//    var id: UUID {
//        return UUID()
//    }
//    case red = "Red"
//    case yellow = "Yellow"
//    case orange = "Orange"
//    case purple = "Purple"
//    case blue = "Blue"
//    case indigo = "Indigo"
//    case green = "Green"
//    case mint = "Mint"
//}
//
//extension TheColor {
//    var title: String {
//        switch self {
//        case .red:
//            return "Red"
//        case .yellow:
//            return "Yellow"
//        case .orange:
//            return "Orange"
//        case .purple:
//            return "Purple"
//        case .blue:
//            return "Blue"
//        case .indigo:
//            return "Indigo"
//        case .green:
//            return "Green"
//        case .mint:
//            return "Mint"
//            
//        }
//    }
//}
//let duedate = Date()
//let format = duedate.getFormattedDate(format: "yyyy-MM-dd") // Set output format
//
//struct AddingEvents: View {
//    @State private var name: String = ""
//    @State private var theColor: TheColor = .blue
//    @State private var duedate: String = ""
//
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Event.entity(), sortDescriptors: [NSSortDescriptor(key: "duedate", ascending: true)]) private var allEvents: FetchedResults<Event>
//    
//    private func addEvent() {
//        do {
//            let event = Event(context: viewContext)
//            event.name = name
//            event.thecolor = theColor.rawValue
//            event.duedate = Date()
//            try viewContext.save()
//            
//        } catch{
//            print(error.localizedDescription)
//            
//        }
//    }
//    private func selectedColor (_ value: String) -> Color{
//        let  thecolor = TheColor(rawValue: value)
//        
//        switch theColor {
//        case .red:
//            return Color.red
//        case .yellow:
//            return Color.yellow
//        case .orange:
//            return Color.orange
//        case .purple:
//            return Color.purple
//        case .blue:
//            return Color.blue
//        case .indigo:
//            return Color.indigo
//        case .green:
//            return Color.green
//        case .mint:
//            return Color.mint
//        }
//    }
//    
//    //    @State private var date = Date()
//    @State private var dueDate = Date()
//    @State private var showsheet: Bool = false
//    @State private var showingDetail = false
//    @State private var selectedColor: Color = .blue
//    
//    var body: some View {
//     
//            
//            VStack(alignment: .leading) {
//                    
//                    DatePicker("Please enter a date", selection: $dueDate)
//                        .padding([.leading, .bottom, .trailing])
//                        .labelsHidden()
//                        .datePickerStyle(.graphical)
//                    
//                    
//                    VStack(alignment: .leading){
//                        Text("Event Name:")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        TextField("Event Name", text: $name)
//                            .textFieldStyle(.roundedBorder)
//                        
//                        
//                    }.padding()
//                    
//                    MyColorPicker(selectedColor: $selectedColor)
//                    
//                    //                Picker("Pick a color for the event borders", selection: $theColor) {
//                    //                    ForEach(TheColor.allCases) { thecolor in
//                    //                        Text(thecolor.title).tag(thecolor)
//                    //                            .fontWeight(.bold)
//                    //                    }.pickerStyle(.segmented)
//                    //                }.padding()
//                    
//                    Button (action: {
//                        addEvent()
//                        
//                    }, label: {
//                        Text("Add Event")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .padding (16.0)
//                            .background(Color.accentColor)
//                            .foregroundColor(.white)
//                            .clipShape(RoundedRectangle (cornerRadius:10.0, style: .continuous))
//                    })
//                    
//                }
//            }
//        }
//    
//
//
//struct AddingEvents_Previews: PreviewProvider {
//    static var previews: some View {
//        let persistentContainer = CoreDataManager.shared.persistentContainer
//        AddingEvents().environment(\.managedObjectContext, persistentContainer.viewContext)
//        
//    }
//}
//extension Date {
//   func getFormattedDate(format: String) -> String {
//        let dateformat = DateFormatter()
//        dateformat.dateFormat = "MM/dd/yyyy"
//        return dateformat.string(from: self)
//    }
//}
