//
//  MainWindowGroup.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

@main
struct MainWindowGroup: App {
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(Store())
        }
    }
}
