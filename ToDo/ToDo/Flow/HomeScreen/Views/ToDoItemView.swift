//
//  ToDoItemView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ToDoItemView: View {
    
    var body: some View { return bodyView() }
    
    let todoItem: ToDoItem
    
    private func bodyView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(Constants.name)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(todoItem.name)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(Constants.date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(todoItem.date, style: .date)
                }
            }
            Text(Constants.target)
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

private extension ToDoItemView {
    
    enum Constants {
        
        static let name: String = "Name:"
        static let date: String = "Date:"
        static let target: String = "Target:"
    }
}

#if DEBUG
struct ToDoView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoItemView(
            todoItem: ToDoItem(
                name: "Name",
                target: "Some Target...",
                date: Date(), priority: .medium
            )
        )
    }
}
#endif
