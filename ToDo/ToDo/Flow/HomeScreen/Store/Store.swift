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
    
    private let reducer: Reducer
    
    init(
        state: AppState = AppState(todoItems: [ToDoItem](), sortType: .order),
        reducer: Reducer = Reducer()
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        reducer.update(&state, with: action)
    }
}
