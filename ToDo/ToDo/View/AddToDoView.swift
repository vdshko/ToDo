//
//  AddToDoView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct AddToDoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: Store
    @State private var name = ""
    @State private var target = ""
    @State private var date = Date()
    @State var priority: Priority = .normal
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("name...", text: $name)
                    TextField("target...", text: $target)
                }
                Section {
                    Picker(selection: $priority, label: Text("Priority")) {
                        ForEach(Priority.allCases) { priority in
                            Label(
                                title: { Text(priority.title) },
                                icon: { Image(systemName: "exclamationmark.triangle") }
                            )
                            .foregroundColor(priority.color)
                            .tag(priority)
                        }
                    }
                }
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                leading: Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                },
                trailing: Button(
                    action: { store.dispatch(action: .addToDoItem(ToDoItem(name: name, target: target, date: date, priority: priority)))
                        presentationMode.wrappedValue.dismiss()
                    }) {
                    Text("Save")
                }
                .disabled(name.isEmpty || target.isEmpty)
            )
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddToDoView()
    }
}
