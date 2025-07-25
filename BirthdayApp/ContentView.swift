//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Placidia Ong on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends:[Friend] = [
        Friend(name: "Serena", birthday: .now),
        Friend(name: "Annabelle", birthday: .now),
        Friend(name: "Lihie", birthday: .now)
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name){ friends in
                HStack {
                    Text(friends.name)
                    Spacer()
                    Text(friends.birthday, format:
                        .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday 🎂")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in:
                        Date.distantPast...Date.now,
                        displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
}
