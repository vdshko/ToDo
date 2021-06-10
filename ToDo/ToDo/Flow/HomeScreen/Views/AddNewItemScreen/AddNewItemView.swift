//
//  AddNewItemView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct AddNewItemView: View {
    
    var body: some View { return bodyView() }
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: Store
    
    @State private var name = ""
    @State private var target = ""
    @State private var date = Date()
    @State private var priority: Priority = .normal
    
    private func bodyView() -> some View {
        NavigationView {
            Form {
                Section {
                    TextField(Constants.name, text: $name)
                    TextField(Constants.target, text: $target)
                }
                Section {
                    Picker(selection: $priority, label: Text(Constants.priority)) {
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
                DisclosureGroup(Constants.date) {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            .navigationBarTitle(Constants.date, displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Text(Constants.cancel)
                        .foregroundColor(.red)
                },
                trailing: Button(
                    action: {
                        store.dispatch(
                            action: .addToDoItem(
                                ToDoItem(name: name, target: target, date: date, priority: priority)
                            )
                        )
                        presentationMode.wrappedValue.dismiss()
                    }
                ) {
                    Text(Constants.save)
                }
                .disabled(name.isEmpty || target.isEmpty)
            )
        }
    }
}

private extension AddNewItemView {
    
    enum Constants {
        
        static let name: String = "name..."
        static let target: String = "target..."
        static let priority: String = "Priority"
        static let date: String = "Date"
        static let add: String = "Add"
        static let cancel: String = "Cancel"
        static let save: String = "Save"
    }
}

#if DEBUG
struct AddToDoView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddNewItemView()
    }
}
#endif
