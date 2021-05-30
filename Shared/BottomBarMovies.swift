//
//  BottomBarMovies.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct BottomBarMovies: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("Django Unchained")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(height: 20)
                .truncationMode(.tail)
                .padding(.horizontal)
            
            Text("10 min remaining").font(.system(size: 16, weight: .light))
                .padding(.horizontal)
        }
        .frame(maxWidth: screen.width)
        .frame(maxHeight: 70)
        .background(Color(colorScheme == .dark ? .black : .white)
                        .ignoresSafeArea(edges: .bottom))
    }
}

struct BottomBarMovies_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarMovies()
    }
}
