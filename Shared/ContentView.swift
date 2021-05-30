//
//  ContentView.swift
//  Shared
//
//  Created by Nils Fauvain on 17.05.21.
//

import SwiftUI

let screen = UIScreen.main.bounds

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Namespace var buttonAnimation
    
    @State var musictapped = false
    
    @State var home = false
    @State var movies = false
    @State var music = true
    @State var search = false
    
    @State var shuffle = false
    @State var repeatSong = false
    
    @State var normalLyrics = false
    @State var syncLyrics = false
    
    var body: some View {
        
        ZStack{
            
            ZStack {
                VStack(spacing: 0) {
                    HStack{
                        ZStack {
                            Text("Home")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .padding()
                                .offset(x: home ? 0 : -2000)
                            
                            Text("Music")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .padding()
                                .offset(x: music ? 0 : -2000)
                            
                            Text("Movies")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .padding()
                                .offset(x: movies ? 0 : -2000)
                            
                            Text("Search")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .padding()
                                .offset(x: search ? 0 : -2000)
                            
                        }
                        Spacer()
                    }
                    ZStack{
                        MusicContent()
                            .offset(x: music ? 0 : -2000)
                        MoviesContent()
                            .offset(x: movies ? 0 : -2000)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            self.home = true
                            self.music = false
                            self.movies = false
                            self.search = false
                            hideKeyboard()
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $home, icon: true, text: false, buttonIconName: "house", buttonText: "", buttonTextIconColor: .blue, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.866713335, green: 0.8142948297, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            self.home = false
                            self.music = true
                            self.movies = false
                            self.search = false
                            hideKeyboard()
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $music, icon: true, text: false, buttonIconName: "music.note", buttonText: "", buttonTextIconColor: .red, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.866713335, green: 0.8142948297, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            self.home = false
                            self.music = false
                            self.movies = true
                            self.search = false
                            hideKeyboard()
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $movies, icon: true, text: false, buttonIconName: "film", buttonText: "", buttonTextIconColor: .green, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.866713335, green: 0.8142948297, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            self.home = false
                            self.music = false
                            self.movies = false
                            self.search = true
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $search, icon: true, text: false, buttonIconName: "magnifyingglass", buttonText: "", buttonTextIconColor: .purple, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.866713335, green: 0.8142948297, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Spacer()
                    }
                    .offset(y: -80)
                }
            }
            .blur(radius: musictapped ? 40 : 0)
            
            VStack{
                
                if !musictapped {
                    Spacer()
                }
                
                ZStack {
                    BottomBarMusic(musictapped: $musictapped, shuffle: $shuffle, repeatSong: $repeatSong)
                        .offset(x: music ? 0 : -2000)
                    
                    BottomBarSearch()
                        .offset(x: search ? 0 : -2000)
                    
                    BottomBarMovies()
                        .offset(x: movies ? 0 : -2000)
                }
                
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.75))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
