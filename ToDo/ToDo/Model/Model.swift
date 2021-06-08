//
//  Model.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ToDoItem: Identifiable, Codable {
    
    var id = UUID().uuidString
    let name: String
    let target: String
    let date: Date
    let priority: Priority
}

enum Priority: Int, Identifiable, CaseIterable, Codable {
    
    case normal, medium, high
    
    var id: Int { return rawValue }
    var title: String {
        switch self {
        case .normal: return "Normal"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
    var color: Color {
        switch self {
        case .normal: return .blue
        case .medium: return .orange
        case .high: return .red
        }
    }
}

enum SortType: String, Identifiable, CaseIterable {
    
    case order, date, priority
    
    var id: String { rawValue }
}

struct AppState {
    
    var todoItems: [ToDoItem]
    var sortType: SortType
}

enum Action {
    
    case addToDoItem(ToDoItem)
    case removeTodoItem(IndexSet)
    case sort(SortType)
}

func reducer(state: inout AppState, action: Action, completion: @escaping (AppState) -> Void) {
    switch action {
    case .addToDoItem(let item): state.todoItems.append(item)
    case .removeTodoItem(let indexSet): state.todoItems.remove(atOffsets: indexSet)
    case .sort(let type):
        switch type {
        case .order: state.todoItems.sort(by: { $0.name < $1.name })
        case .date: state.todoItems.sort(by: { $0.date < $1.date })
        case .priority: state.todoItems.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
}
