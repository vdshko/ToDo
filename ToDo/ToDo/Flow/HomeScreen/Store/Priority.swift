//
//  Priority.swift
//  ToDo
//
//  Created by Vlad Shkodich on 10.06.2021.
//

import struct SwiftUI.Color

enum Priority: Int, Identifiable, CaseIterable {
    
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
