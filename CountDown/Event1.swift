//
//  ContentView.swift
//  CountDown
//
//  Created by Fatma Gazwani on 11/06/1444 AH.
//

import SwiftUI
import CoreData

enum TheColor: String, Identifiable, CaseIterable {
    var id: UUID {
        return UUID()
    }
    case red = "Red"
    case yellow = "Yellow"
    case orange = "Orange"
    case purple = "Purple"
    case blue = "Blue"
    case indigo = "Indigo"
    case green = "Green"
    case mint = "Mint"
}

extension TheColor {
    var title: String {
        switch self {
        case .red:
            return "Red"
        case .yellow:
            return "Yellow"
        case .orange:
            return "Orange"
        case .purple:
            return "Purple"
        case .blue:
            return "Blue"
        case .indigo:
            return "Indigo"
        case .green:
            return "Green"
        case .mint:
            return "Mint"

            }
        }
}

struct Event1: View {
    @State private var name: String = ""
    @State private var theColor: TheColor = .blue
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Event.entity(), sortDescriptors: [NSSortDescriptor(key: "duedate", ascending: true)]) private var allEvents: FetchedResults<Event>
    
    private func addEvent() {
        do {
            let event = Event(context: viewContext)
            event.name = name
            event.thecolor = theColor.rawValue
            event.duedate = Date()
            try viewContext.save()
        } catch{
            print(error.localizedDescription)
            
        }
    }
    private func theSelectedColor(_ value: String) -> Color{
        let  thecolor = TheColor(rawValue: value)
        
        switch theColor {
        case .red:
            return Color.red
        case .yellow:
            return Color.yellow
        case .orange:
            return Color.orange
        case .purple:
            return Color.purple
        case .blue:
            return Color.blue
        case .indigo:
            return Color.indigo
        case .green:
            return Color.green
        case .mint:
            return Color.mint
        }
    }
    
    private func deleteEvent (at offsets: IndexSet) {
        offsets.forEach {
            index in
            let event = allEvents[index]
            viewContext.delete(event)
            do {
                try viewContext.save()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    //    @State private var date = Date()
    @State private var dueDate = Date()
    @State private var date = Date()
    @State private var showsheet: Bool = false
    @State private var showingDetail = false
    
    var body: some View {
        
        Group{
            ZStack{
                
                if(allEvents.isEmpty) {
                    
                    VStack(alignment: .trailing){
                        HStack(alignment: .top){
                            
                            Button("Add an event") {
                                showingDetail = true
                            }
                            .sheet(isPresented: $showingDetail) {
                                ScrollView{
                                    
                                    
                                    VStack {
                                        
                                        DatePicker("Please enter a date", selection: $dueDate)
                                            .padding([.leading, .bottom, .trailing])
                                            .labelsHidden()
                                            .datePickerStyle(.graphical)
                                        
                                        
                                        VStack(alignment: .leading){
                                            Text("Event Name:")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            TextField("Event Name", text: $name)
                                                .textFieldStyle(.roundedBorder)
                                            
                                            
                                        }.padding()
                                        
                                        Picker("Pick a color for the event borders", selection: $theColor) {
                                            ForEach(TheColor.allCases) { thecolor in
                                                Text(thecolor.title).tag(thecolor)
                                                    .fontWeight(.bold)
                                                
                                            }.pickerStyle(.segmented)
                                        }.padding()
                                        Button (action: {
                                            addEvent()
                                            
                                        }, label: {
                                            Text("Add Event")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .padding (16.0)
                                                .background(Color.accentColor)
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle (cornerRadius:10.0, style: .continuous))
                                        })
                                        //                                        DismissingView()
                                        
                                    }
                                }
                                }
                                }
                                .frame(height: 20)
                                .padding(.top)
                                .padding(.horizontal, 24)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                                Spacer()
                                
                                
                                Text("No Eevnts Yet ")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                                Text("""
press Add to add a new event
""")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                
                                Spacer()
                            }
                        
                    
                } else {
                    
                    
                    VStack(alignment: .trailing){
                        HStack(alignment: .top){
                            Spacer()
                            Button("Add an event") {
                                showingDetail = true
                            }
                            .sheet(isPresented: $showingDetail) {
                                ScrollView{
                                    
                                    
                                    VStack {
                                        
                                        DatePicker("Please enter a date", selection: $dueDate)
                                            .padding([.leading, .bottom, .trailing])
                                            .labelsHidden()
                                            .datePickerStyle(.graphical)
                                        
                                        
                                        VStack(alignment: .leading){
                                            Text("Event Name:")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            TextField("Event Name", text: $name)
                                                .textFieldStyle(.roundedBorder)
                                            
                                            
                                        }.padding()
                                        
                                        Picker("Pick a color for the event borders", selection: $theColor) {
                                            ForEach(TheColor.allCases) { thecolor in
                                                Text(thecolor.title).tag(thecolor)
                                                    .fontWeight(.bold)
                                                
                                            }.pickerStyle(.segmented)
                                        }.padding()
                                        Button (action: {
                                            addEvent()
                                            
                                        }, label: {
                                            Text("Add Event")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .padding (16.0)
                                                .background(Color.accentColor)
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle (cornerRadius:10.0, style: .continuous))
                                        })
//                                        DismissingView()
                                        
                                    }
                                }


                            }
                            .frame(height: 20)
                            .padding(.top)
                            .padding(.horizontal, 24)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        }
                                List{
                                    ForEach(allEvents) { event in
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 13)
                                                .stroke(theSelectedColor(event.thecolor!), lineWidth: 5)
                                                .frame(height: 120)
                                                .ignoresSafeArea()
                                            
                                            VStack(alignment: .leading){
                                                HStack(alignment: .top){
                                                    Text(event.name ?? "")
                                                    Text("-")
                                                    //                                            Text(event.duedate ?? "")
                                                    Spacer()
                                                }.padding(.horizontal)
                                                    .font(.body)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.black)
                                                
                                                Spacer()
                                            }
                                            .padding()
                                            VStack{
                                                Text(date, style:.timer) // 47:59:50
                                                    .font(.title)
                                                    .padding(.top)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(theSelectedColor(event.thecolor!))
                                                //                                    Text("00 , 00 , 00")
                                                HStack{
                                                    Text("days")
                                                    Text("hours")
                                                    Text("minutes")
                                                }.font(.caption)

                                            }
                                        }
                                    }.onDelete(perform: deleteEvent)
                                }.scrollContentBackground(.hidden)
                                
                            }
                        }
                    }
                }
            }
        }
    

    struct Event1_Previews: PreviewProvider {
        static var previews: some View {
            let persistentContainer = CoreDataManager.shared.persistentContainer
            Event1().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }

