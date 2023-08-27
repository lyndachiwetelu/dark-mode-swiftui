//
//  ContentView.swift
//  DarkMode
//
//  Created by Lynda Chiwetelu on 27.08.23.
//

import SwiftUI

struct Reminder {
    let id: Int
    let title: String
    let time: String
}

struct ContentView: View {
    @Environment(\.colorScheme) private var userColorScheme
    
    private var reminders: [Reminder] = [
        Reminder(id:1, title: "Walk the dog", time: "14 mins"),
        Reminder(id: 2, title: "Bake a marble cake", time: "20 mins"),
        Reminder(id: 3, title: "Make an app", time: "1 hr"),
        Reminder(id: 4, title: "Clean the room", time: "1.5 hrs"),
    ]
    
    @State private var viewColorScheme: ColorScheme = .light
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle("", isOn: $isOn).tint(Color("AppAccentBlue"))
            
            Text("Upcoming Reminders")
                .font(.title3)
                .foregroundColor(Color("AppNavyBlue"))
                .padding(.bottom, 30)
            
            VStack {
                ForEach(reminders, id:\.id) { reminder in
                    HStack {
                        Text(reminder.title).foregroundColor(Color(UIColor.label))
                        Spacer()
                        Text(reminder.time).foregroundColor(Color(UIColor.label))
                    }.padding(.all, 20)
                        .background(Color("AppBlue"))
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                }
            }
            
            Text("Completed Reminders")
                .font(.title3)
                .foregroundColor(Color("AppNavyBlue"))
                .padding(.bottom, 20).padding(.top, 30)
            
            VStack {
                Image("no-tasks")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
                Text("You have no completed tasks yet").foregroundColor(.gray)
            }
            
            
            Spacer()
            
        }.preferredColorScheme(viewColorScheme)
        .onAppear() {
            switchAppearance()
        }.onChange(of: isOn, perform: { newValue in
            if newValue == false {
                viewColorScheme = .dark
                return
            }
            
            viewColorScheme = .light
        })
        
        .padding(.all, 20)
    }
    
    func switchAppearance() {
        viewColorScheme = userColorScheme
        if viewColorScheme == .light {
            isOn = true
            return
        }
        
        isOn = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
