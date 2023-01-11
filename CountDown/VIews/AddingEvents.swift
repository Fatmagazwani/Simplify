////
////  Events.swift
////  CountDown
////
////  Created by Fatma Gazwani on 11/06/1444 AH.
////
//
import SwiftUI
import CoreData

//enum BordersColor: String, Identifiable, CaseIterable {
//    var id: UUID {
//        return UUID()
//    }
//    case red = "red"
//    case yellow = "yellow"
//    case orange = "orange"
//    case purple = "purple"
//    case blue = "blue"
//    case indigo = "indigo"
//    case green = "green"
//    case mint = "mint"
//}
//
//extension BordersColor {
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
//let format = duedate.getFormattedDate(format: "yyyy-MM-dd")
//
struct AddingEvents: View {
//    @State private var name: String = ""
//    @State private var ColorsPickers: BordersColor = .blue
//    @State private var duedate: String = ""
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Event.entity(), sortDescriptors: [NSSortDescriptor(key: "duedate", ascending: true)]) private var allEvents: FetchedResults<Event>
//
//    private func addEvent() {
//        print(allEvents)
//        do {
//            let event = Event(context: viewContext)
//            event.name = name
//            event.thecolor = ColorsPickers.rawValue
//            event.duedate = dueDate
//            try viewContext.save()
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//    private func theSelectedColor(_ value: String) -> Color{
//        let  thecolor = BordersColor(rawValue: value)
//
//        switch thecolor {
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
//        case .none:
//            return Color.blue
//        }
//    }
//
//    private func deleteEvent (at offsets: IndexSet) {
//        offsets.forEach {
//            index in
//            let event = allEvents[index]
//            viewContext.delete(event)
//            do {
//                try viewContext.save()
//            }catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//    @State private var dueDate = Date()
//
//    //    @State private var date = Date()
//    @State private var showsheet: Bool = false
//    @State private var showingDetail = false
//    @Environment(\.dismiss) var dismiss
//    @State private var selectedColor: Color = .blue
    var body: some View {
        VStack{
            Text("yay")
        }
//        ScrollView{
//            VStack{
//                DatePicker("Please_choose_a_date", selection: $dueDate)
//                    .accessibilityLabel("Please_choose_a_date")
//                    .padding([.leading, .bottom, .trailing])
//                    .labelsHidden()
//                    .datePickerStyle(.graphical)
//
//
//                VStack(alignment: .leading){
//                    Text("Event_Name:")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                    TextField("Event_Name", text: $name)
//                        .accessibilityLabel("Enter_event_Name")
//                        .textFieldStyle(.roundedBorder)
//                }.padding()
//
//                //                                            MyColorPicker(selectedColor: $selectedColor)
//
//                Picker("Pick_a_color_for_the_event_borders", selection: $ColorsPickers) {
//                    ForEach(BordersColor.allCases) { thecolor in
//                        Text(thecolor.title).tag(thecolor)
//                            .fontWeight(.bold)
//
//                    }.pickerStyle(.menu)
//                }.padding()
//
//                Notification()
//
//                Button (action: {
//                    addEvent()
//                    dismiss()
//
//                }, label: {
//                    Text("Add_Event")
//                        .accessibilityLabel("Add_a_new_event")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .padding (16.0)
//                        .background(Color.accentColor)
//                        .foregroundColor(.white)
//                        .clipShape(RoundedRectangle (cornerRadius:10.0, style: .continuous))
//                })
//
//
//                .frame(height: 20)
//                .padding(.top)
//                .padding(.horizontal, 24)
//                .font(.title3)
//                .foregroundColor(.accentColor)
//                Spacer()
//            }
//
//
//        }
    }
}



struct AddingEvents_Previews: PreviewProvider {
    static var previews: some View {
        let persistentContainer = CoreDataManager.shared.persistentContainer
        AddingEvents()
            .environment(\.managedObjectContext, persistentContainer.viewContext)
        
    }
}
//extension Date {
//    func getFormattedDate(format: String) -> String {
//        let dateformat = DateFormatter()
//        dateformat.dateFormat = "MM/dd/yyyy"
//        return dateformat.string(from: self)
//    }
//}
