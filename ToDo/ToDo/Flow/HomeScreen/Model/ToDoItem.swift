//
//  ToDoItem.swift
//  ToDo
//
//  Created by Vlad Shkodich on 10.06.2021.
//

import struct Foundation.UUID
import struct Foundation.Date

struct ToDoItem: Identifiable {
    
    let id = UUID().uuidString
    let name: String
    let target: String
    let date: Date
    let priority: Priority
}
