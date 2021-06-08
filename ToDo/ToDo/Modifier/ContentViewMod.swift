//
//  ContentViewMod.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct ContentViewMod: ViewModifier {
    
    @EnvironmentObject var store: Store
    
    func body(content: Content) -> some View {
        content
            .navigationTitle("My Todo's")
            .navigationBarItems(
                trailing: HStack(spacing: 30) {
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
            )
            .onChange(of: store.sorted) { sort in
                guard !store.state.todoItems.isEmpty else {
                    return
                }
                
                withAnimation() { store.dispatch(action: .sort(sort)) }
            }
            .fullScreenCover(isPresented: $store.isPresented) {
                AddToDoView()
            }
    }
}
