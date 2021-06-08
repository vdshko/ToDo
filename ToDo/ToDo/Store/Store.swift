//
//  Store.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import Foundation

final class Store: ObservableObject {
    
    @Published var isPresented = false
    @Published var sorted: SortType = .order
    @Published private(set) var state: AppState
    
    init(state: AppState = AppState(todoItems: [ToDoItem](), sortType: .order)) {
        self.state = state
    }
    
    func dispatch(action: Action) {
        reducer(state: &state, action: action) { newState in
            DispatchQueue.main.async {
                self.state = newState
            }
        }
    }
}
