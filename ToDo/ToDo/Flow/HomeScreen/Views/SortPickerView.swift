//
//  SortPickerView.swift
//  ToDo
//
//  Created by Vlad Shkodich on 08.06.2021.
//

import SwiftUI

struct SortPickerView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        Picker(selection: $store.sorted, label: Text("")) {
            ForEach(SortType.allCases) {
                Text($0.rawValue.capitalized)
                    .tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

#if DEBUG
struct SortPickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        SortPickerView()
            .environmentObject(Store())
    }
}
#endif
