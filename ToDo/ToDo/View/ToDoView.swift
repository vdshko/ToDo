//
//  ToDoView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ToDoView: View {
    
    var todoItem: ToDoItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(todoItem.name)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Date:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(todoItem.date, style: .date)
                }
            }
            Text("Target:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(todoItem.target)
                .italic()
        }
        .padding(10)
        .background(todoItem.priority.color.opacity(0.15))
        .cornerRadius(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(todoItem.priority.color, lineWidth: 0.7)
                .shadow(color: todoItem.priority.color, radius: 0.7)
        )
    }
}

struct ToDoView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoView(todoItem: ToDoItem(name: "Name", target: "Some Target...", date: Date(), priority: .medium))
    }
}
