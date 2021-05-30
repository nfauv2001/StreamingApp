//
//  test.swift
//  StreamingApp
//
//  Created by Nils Fauvain on 17.05.21.
//

import SwiftUI

struct test: View {
    
    @State var button = false
    
    @Namespace var animation
    
    var frame: CGFloat {
        button ? 300 : 44
    }
    
    var body: some View {
        
        VStack{
            Spacer()
            
            VStack{
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: frame, height: frame)
                        .padding(.top, button ? 20 : 0)
                    
                    if button == false {
                        Text("Songname")
                            .font(.headline)
                            .matchedGeometryEffect(id: "albumname", in: animation)
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()){
                                self.button.toggle()
                            }
                        }, label: {
                            Image(systemName: "play.fill")
                        })
                        .matchedGeometryEffect(id: "play", in: animation)
                    }
                }
                
                if button {
                    
                    Button(action: {
                        withAnimation(.spring()){
                            self.button.toggle()
                        }
                    }, label: {
                        Image(systemName: "play.fill")
                    })
                    .matchedGeometryEffect(id: "play", in: animation)
                    
                    Text("Songname")
                        .font(.headline)
                        .matchedGeometryEffect(id: "albumname", in: animation)
                        .padding(.bottom, 60)
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: button ? 400 : 60)
            .background(Color.gray.cornerRadius(20))
        }
        .padding()
        .shadow(radius: 10)
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
