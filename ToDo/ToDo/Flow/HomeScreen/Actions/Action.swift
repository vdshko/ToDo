//
//  Action.swift
//  ToDo
//
//  Created by Vlad Shkodich on 10.06.2021.
//

import struct SwiftUI.IndexSet

enum Action {
    
    case addToDoItem(ToDoItem)
    case removeTodoItem(IndexSet)
    case sort(SortType)
}
