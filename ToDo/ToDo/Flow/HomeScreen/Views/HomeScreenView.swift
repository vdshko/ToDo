//
//  HomeScreenView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                SortPickerView()
                ToDoItemsListView()
            }
            .modifier(HomeScreenNavigationModifier())
        }
    }
}

#if DEBUG
struct HomeScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeScreenView()
            .environmentObject(Store())
    }
}
#endif
