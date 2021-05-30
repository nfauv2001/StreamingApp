//
//  BottomBarHome.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct BottomBarHome: View {
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).cornerRadius(20)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1), radius: 10, y: 7)
            
            HStack {
                Image(systemName: "person").font(.system(size: 20))
                    .padding()
            }
        }
    }
}

struct BottomBarHome_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarHome()
    }
}
