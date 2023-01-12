//
//  EventsList.swift
//  CountDown
//
//  Created by Fatma Gazwani on 18/06/1444 AH.
//

import SwiftUI

struct EventsList: View {
    var body: some View {
        
        Text("lists")
//        ScrollView{
//            List{
//                ForEach(allEvents) { event in
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 13)
//                            .fill(theSelectedColor(event.thecolor!))
//                            .opacity(0.1)
//                            .frame(height: 120)
//                            .shadow(radius: 2, x: 5)
//                        RoundedRectangle(cornerRadius: 13)
//                            .stroke(theSelectedColor(event.thecolor!), lineWidth: 2)
//                            .frame(height: 120)
//
//
//                        VStack(alignment: .leading){
//                            HStack(alignment: .top){
//                                Text(event.name ?? "")
//                                Text("-")
//                                Text(event.duedate!, style:.date)
//                                Spacer()
//                            }.padding(.horizontal)
//                                .font(.caption)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color("Black"))
//
//                            Spacer()
//                        }.padding(.top)
//                        VStack{
//                            Text(event.duedate!, style:.timer) // 47:59:50
//                                .font(.title)
//                                .padding(.top)
//                                .fontWeight(.bold)
////                                            .foregroundColor(theSelectedColor(event.thecolor!))
//                        }
//                    }
//                }.onDelete(perform: deleteEvent)
//            }.accessibilityLabel("Press_on_the_lists_to_view_their_information")
//                .scrollContentBackground(.hidden)
//        }
    }
}

struct EventsList_Previews: PreviewProvider {
    static var previews: some View {
        EventsList()
    }
}
