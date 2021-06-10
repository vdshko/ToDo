//
//  SortType.swift
//  ToDo
//
//  Created by Vlad Shkodich on 10.06.2021.
//

enum SortType: String, Identifiable, CaseIterable {
    
    case order, date, priority
    
    var id: String { return rawValue }
}
