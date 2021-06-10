//
//  ToDoItemsListView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ToDoItemsListView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        List {
            ForEach(store.state.todoItems) { ToDoItemView(todoItem: $0) }
                .onDelete { store.dispatch(action: .removeTodoItem($0)) }
        }
        .listStyle(InsetListStyle())
    }
}

#if DEBUG
struct ToDoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoItemsListView()
            .environmentObject(Store())
    }
}
#endif
