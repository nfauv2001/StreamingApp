//
//  HomeContent.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct HomeContent: View {
    
    @State var settings = true
    @State var profile = false
    
    var body: some View {
        VStack{
            // Top Bar
            HStack{
                
                Spacer()
                
                Button(action: {
                    self.settings = true
                    self.profile = false
                }, label: {
                    CustomAdditionalButtonPreset(buttonToggled: $settings, icon: false, text: true, buttonIconName: "", buttonText: "Settings", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 0.6816215513, green: 0.9011187023, blue: 1, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
                
                Button(action:{
                    self.settings = false
                    self.profile = true
                }, label: {
                        CustomAdditionalButtonPreset(buttonToggled: $profile, icon: false, text: true, buttonIconName: "", buttonText: "Profile", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 0.6816215513, green: 0.9011187023, blue: 1, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
            }
            .padding(.bottom)
            
            ZStack {
                
                // Profile
                if profile {
                    ScrollView {
                        VStack(spacing: 20){
                            Text("Hey Nils !").font(.system(size: 20, weight: .bold, design: .rounded))
                            Text("nilsfauvain@icloud.com").font(.system(size: 16, weight: .light, design: .rounded))
                            Text("200 Gb Music").font(.system(size: 14, weight: .bold, design: .rounded))
                            Text("400 Gb Movies").font(.system(size: 14, weight: .bold, design: .rounded))
                        }
                    }
                }
                
                // Settings
                if settings {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20){
                            HStack{
                                Text("Color").bold()
                                Spacer()
                            }
                            
                            HStack{
                                Text("Language").bold()
                                Spacer()
                            }
                            
                            HStack{
                                Text("Sorting").bold()
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1))
        }
    }
}

struct HomeContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeContent()
    }
}
