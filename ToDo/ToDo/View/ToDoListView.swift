//
//  ToDoListView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var store: Store
    var body: some View {
        List {
            ForEach(store.state.todoItems) { item in
                ToDoView(todoItem: item)
            }
            .onDelete { store.dispatch(action: .removeTodoItem($0)) }
        }
        .listStyle(InsetListStyle())
    }
}

struct ToDoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoListView()
            .environmentObject(Store())
    }
}
