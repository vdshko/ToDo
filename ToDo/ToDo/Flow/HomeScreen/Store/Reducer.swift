//
//  Reducer.swift
//  ToDo
//
//  Created by Vlad Shkodich on 10.06.2021.
//

import struct SwiftUI.IndexSet

final class Reducer {
    
    func update(_ state: inout AppState, with action: Action) {
        switch action {
        case .addToDoItem(let item): addTodoItem(item, for: &state)
        case .removeTodoItem(let indexSet): removeTodoItem(with: indexSet, for: &state)
        case .sort(let type): sort(with: type, for: &state)
        }
    }
    
    private func addTodoItem(_ item: ToDoItem, for state: inout AppState) {
        state.todoItems.append(item)
    }
    
    private func removeTodoItem(with index: IndexSet, for state: inout AppState) {
        state.todoItems.remove(atOffsets: index)
    }
    
    private func sort(with type: SortType, for state: inout AppState) {
        switch type {
        case .order: state.todoItems.sort(by: { $0.name < $1.name })
        case .date: state.todoItems.sort(by: { $0.date < $1.date })
        case .priority: state.todoItems.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
}
