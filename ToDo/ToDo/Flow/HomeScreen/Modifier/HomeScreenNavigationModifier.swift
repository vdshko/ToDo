//
//  HomeScreenNavigationModifier.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct HomeScreenNavigationModifier: ViewModifier {
    
    @EnvironmentObject var store: Store
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(Constants.navigationTitle)
            .navigationBarItems(trailing: NavigationsBarItems())
            .onChange(of: store.sorted) { sort in
                guard !store.state.todoItems.isEmpty else {
                    return
                }
                
                withAnimation() { store.dispatch(action: .sort(sort)) }
            }
            .fullScreenCover(isPresented: $store.isPresented) {
                AddNewItemView()
            }
    }
}

private struct NavigationsBarItems: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        HStack(spacing: 30) {
            EditButton()
                .disabled(store.state.todoItems.isEmpty)
            Button(
                action: { store.isPresented.toggle() },
                label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            )
        }
    }
}
private extension HomeScreenNavigationModifier {
    
    enum Constants {
        
        static let navigationTitle: String = "To Do"
    }
}
