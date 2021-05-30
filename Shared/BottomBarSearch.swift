//
//  BottomBarSearch.swift
//  StreamingApp
//
//  Created by Nils Fauvain on 18.05.21.
//

import SwiftUI

struct BottomBarSearch: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var enteredSearch = ""
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass").font(.system(size: 20))
                .padding(.leading,20)
            TextField("Search for Movies or Music", text: $enteredSearch)
                .padding()
        }
        .frame(maxHeight: 70)
        .background(Color(colorScheme == .dark ? .black : .white)
                        .ignoresSafeArea(edges: .bottom)
        )
    }
}

struct BottomBarSearch_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarSearch()
    }
}
