//
//  BottomBarMusic.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct BottomBarMusic: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Namespace var musicanimation
    
    @Binding var musictapped: Bool
    @Binding var shuffle: Bool
    @Binding var repeatSong: Bool
    
    @State var playerState = CGSize.zero
    
    @State var playlist = false
    @State var lyrics = false
    
    var coverFrame: Int{
        
        if musictapped && playlist{
            return 45
        }
        else if musictapped && lyrics{
            return 45
        }
        else if musictapped {
            return 300
        }
        else {
            return 45
        }
    }
    
    var cornerRadius: Int{
        
        if musictapped && playlist{
            return 5
        }
        else if musictapped && lyrics{
            return 5
        }
        else if musictapped {
            return 40
        }
        else {
            return 5
        }
    }
    
    var coverShadow: Int{
        
        if musictapped && playlist{
            return 3
        }
        else if musictapped && lyrics{
            return 3
        }
        else if musictapped {
            return 10
        }
        else {
            return 3
        }
    }
    
    var body: some View {
        
        VStack{
            
            if musictapped{
                Image(systemName: "chevron.compact.down")
                    .renderingMode(.original)
                    .font(.system(size: 20))
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                    .onTapGesture{
                        self.musictapped = false
                    }
                    .gesture(DragGesture()
                                .onChanged { value in
                                    self.playerState = value.translation
                                }
                                .onEnded { value in

                                    if !musictapped {
                                        if (value.startLocation.y - value.location.y) >= 100 {
                                            self.musictapped = true
                                            self.playerState = CGSize.zero
                                        }
                                    }

                                    if musictapped {
                                        if (value.location.y - value.startLocation.y) >= 200 && (playlist || lyrics){
                                            self.playlist = false
                                            self.lyrics = false
                                            self.musictapped = false
                                            self.playerState = CGSize.zero
                                        }

                                        else if (value.location.y - value.startLocation.y) >= 90 && (playlist || lyrics){
                                            self.playlist = false
                                            self.lyrics = false
                                            self.playerState = CGSize.zero
                                        }

                                        else if (value.startLocation.y - value.location.y) >= 70 && !lyrics{
                                            self.playlist = true
                                            self.playerState = CGSize.zero
                                        }

                                        else if (value.location.y - value.startLocation.y) >= 120 {
                                            self.musictapped = false
                                            self.playerState = CGSize.zero
                                            self.playlist = false
                                            self.lyrics = false
                                        }

                                        else {
                                            self.playerState = CGSize.zero
                                        }
                                    }
                                    self.playerState = CGSize.zero
                                }
                    )
            }
            
            HStack {
                Image("Blackest Blue")
                    .resizable()
                    .frame(width: CGFloat(coverFrame), height: CGFloat(coverFrame))
                    .cornerRadius(CGFloat(cornerRadius))
                    .shadow(radius: CGFloat(coverShadow))
                
                if !musictapped || (musictapped && playlist) || (musictapped && lyrics){
                    VStack(alignment: .leading){
                        Text("Currently Playing").font(.system(size: 18, weight: .semibold, design: .rounded))
                            .truncationMode(.tail)
                            .matchedGeometryEffect(id: "songname", in: musicanimation)
                        
                        Text("Album Name").font(.system(size: 14, weight: .light))
                            .matchedGeometryEffect(id: "albumname", in: musicanimation)
                    }
                    
                    if !musictapped {
                        Spacer()
                    }
                    
                    if !musictapped{
                        Button(action: {
                            // music play pause
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: .constant(true), icon: true, text: false, buttonIconName: "play.fill", buttonText: "", buttonTextIconColor: .primary, buttonTextIconSize: 25, buttonFramex: 25, buttonFramey: 25, buttonCornerRadius: 5, buttonStrokeColor: .blue, buttonBackgroudColor: .blue, buttonRectangleFill: false, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        .matchedGeometryEffect(id: "playbutton", in: musicanimation)
                    }
                }
            }
            .contentShape(Rectangle())
            .padding(musictapped ? 0 : 20)
            .onTapGesture {
                if !musictapped {
                    self.musictapped = true
                }
            }
            .gesture(DragGesture()
                        .onChanged { value in
                            self.playerState = value.translation
                        }
                        .onEnded { value in

                            if !musictapped {
                                if (value.startLocation.y - value.location.y) >= 100 {
                                    self.musictapped = true
                                    self.playerState = CGSize.zero
                                }
                            }

                            if musictapped {
                                if (value.location.y - value.startLocation.y) >= 200 && (playlist || lyrics){
                                    self.playlist = false
                                    self.lyrics = false
                                    self.musictapped = false
                                    self.playerState = CGSize.zero
                                }

                                else if (value.location.y - value.startLocation.y) >= 90 && (playlist || lyrics){
                                    self.playlist = false
                                    self.lyrics = false
                                    self.playerState = CGSize.zero
                                }

                                else if (value.startLocation.y - value.location.y) >= 70 && !lyrics{
                                    self.playlist = true
                                    self.playerState = CGSize.zero
                                }

                                else if (value.location.y - value.startLocation.y) >= 120 {
                                    self.musictapped = false
                                    self.playerState = CGSize.zero
                                    self.playlist = false
                                    self.lyrics = false
                                }

                                else {
                                    self.playerState = CGSize.zero
                                }
                            }
                            self.playerState = CGSize.zero
                        }
            )
            
            if musictapped {
                VStack(){
                    if !playlist && !lyrics {
                        Text("Currently Playing").font(.system(size: 22, weight: .semibold, design: .rounded))
                            .truncationMode(.tail)
                            .matchedGeometryEffect(id: "songname", in: musicanimation)
                            .gesture(DragGesture()
                                        .onChanged { value in
                                            self.playerState = value.translation
                                        }
                                        .onEnded { value in

                                            if !musictapped {
                                                if (value.startLocation.y - value.location.y) >= 100 {
                                                    self.musictapped = true
                                                    self.playerState = CGSize.zero
                                                }
                                            }

                                            if musictapped {
                                                if (value.location.y - value.startLocation.y) >= 200 && (playlist || lyrics){
                                                    self.playlist = false
                                                    self.lyrics = false
                                                    self.musictapped = false
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.location.y - value.startLocation.y) >= 90 && (playlist || lyrics){
                                                    self.playlist = false
                                                    self.lyrics = false
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.startLocation.y - value.location.y) >= 70 && !lyrics{
                                                    self.playlist = true
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.location.y - value.startLocation.y) >= 120 {
                                                    self.musictapped = false
                                                    self.playerState = CGSize.zero
                                                    self.playlist = false
                                                    self.lyrics = false
                                                }

                                                else {
                                                    self.playerState = CGSize.zero
                                                }
                                            }
                                            self.playerState = CGSize.zero
                                        }
                            )
                        
                        Text("Album Name").font(.system(size: 16, weight: .light))
                            .matchedGeometryEffect(id: "albumname", in: musicanimation)
                            .gesture(DragGesture()
                                        .onChanged { value in
                                            self.playerState = value.translation
                                        }
                                        .onEnded { value in

                                            if !musictapped {
                                                if (value.startLocation.y - value.location.y) >= 100 {
                                                    self.musictapped = true
                                                    self.playerState = CGSize.zero
                                                }
                                            }

                                            if musictapped {
                                                if (value.location.y - value.startLocation.y) >= 200 && (playlist || lyrics){
                                                    self.playlist = false
                                                    self.lyrics = false
                                                    self.musictapped = false
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.location.y - value.startLocation.y) >= 90 && (playlist || lyrics){
                                                    self.playlist = false
                                                    self.lyrics = false
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.startLocation.y - value.location.y) >= 70 && !lyrics{
                                                    self.playlist = true
                                                    self.playerState = CGSize.zero
                                                }

                                                else if (value.location.y - value.startLocation.y) >= 120 {
                                                    self.musictapped = false
                                                    self.playerState = CGSize.zero
                                                    self.playlist = false
                                                    self.lyrics = false
                                                }

                                                else {
                                                    self.playerState = CGSize.zero
                                                }
                                            }
                                            self.playerState = CGSize.zero
                                        }
                            )
                    }
                    
                    HStack(spacing: 30){
                        Button(action: {
                            // music skip forward
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: .constant(true), icon: true, text: false, buttonIconName: "backward.fill", buttonText: "", buttonTextIconColor: .primary, buttonTextIconSize: 20, buttonFramex: 30, buttonFramey: 30, buttonCornerRadius: 5, buttonStrokeColor: .blue, buttonBackgroudColor: .blue, buttonRectangleFill: false, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Button(action: {
                            // music play pause
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: .constant(true), icon: true, text: false, buttonIconName: "play.fill", buttonText: "", buttonTextIconColor: .primary, buttonTextIconSize: 25, buttonFramex: 30, buttonFramey: 30, buttonCornerRadius: 5, buttonStrokeColor: .blue, buttonBackgroudColor: .blue, buttonRectangleFill: false, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        .matchedGeometryEffect(id: "playbutton", in: musicanimation)
                        
                        Button(action: {
                            // music skip forward
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: .constant(true), icon: true, text: false, buttonIconName: "forward.fill", buttonText: "", buttonTextIconColor: .primary, buttonTextIconSize: 20, buttonFramex: 30, buttonFramey: 30, buttonCornerRadius: 5, buttonStrokeColor: .blue, buttonBackgroudColor: .blue, buttonRectangleFill: false, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                    }
                    
                    HStack(spacing: 20){
                        Button(action: {
                            self.lyrics.toggle()
                            self.playlist = false
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $lyrics, icon: true, text: false, buttonIconName: "music.note.list", buttonText: "", buttonTextIconColor: .green, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.8676210046, green: 0.9172508717, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        Button(action: {
                            self.playlist.toggle()
                            self.lyrics = false
                        }, label: {
                            CustomAdditionalButtonPreset(buttonToggled: $playlist, icon: true, text: false, buttonIconName: "text.append", buttonText: "", buttonTextIconColor: .red, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.8676210046, green: 0.9172508717, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                        })
                        
                        if playlist {
                            Button(action: {
                                self.shuffle.toggle()
                                self.repeatSong = false
                            }, label: {
                                CustomAdditionalButtonPreset(buttonToggled: $shuffle, icon: true, text: false, buttonIconName: "shuffle", buttonText: "", buttonTextIconColor: .blue, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.8676210046, green: 0.9172508717, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                            })
                            
                            Button(action: {
                                self.repeatSong.toggle()
                                self.shuffle = false
                            }, label: {
                                CustomAdditionalButtonPreset(buttonToggled: $repeatSong, icon: true, text: false, buttonIconName: "repeat.1", buttonText: "", buttonTextIconColor: .purple, buttonTextIconSize: 17, buttonFramex: 50, buttonFramey: 30, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: Color(#colorLiteral(red: 0.8676210046, green: 0.9172508717, blue: 1, alpha: 1)), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                            })
                        }
                    }
                    .padding(10)
                }
            }
            
            if musictapped && playlist{
                ScrollView {
                    ForEach(musicsData){ artist in
                        HStack{
                            Image(artist.albumName).resizable().frame(width: 40, height: 40).clipShape(Circle())
                            Text(artist.albumArtist)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            if musictapped && lyrics{
                ScrollView {
                    ForEach(0..<10){ _ in
                        Text("Lyrics").padding(.horizontal)
                    }
                }
            }
        }
        .frame(maxWidth: screen.width)
        .frame(maxHeight: musictapped ? -playerState.height+screen.height : 70)
        .background(Color(colorScheme == .dark ? .black : .white)
                        .ignoresSafeArea(edges: .bottom)
                        .opacity(musictapped ? 0.001 : 1)
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.playerState = value.translation
                                    }
                                    .onEnded { value in

                                        if !musictapped {
                                            if (value.startLocation.y - value.location.y) >= 100 {
                                                self.musictapped = true
                                                self.playerState = CGSize.zero
                                            }
                                        }

                                        if musictapped {
                                            if (value.location.y - value.startLocation.y) >= 200 && (playlist || lyrics){
                                                self.playlist = false
                                                self.lyrics = false
                                                self.musictapped = false
                                                self.playerState = CGSize.zero
                                            }

                                            else if (value.location.y - value.startLocation.y) >= 90 && (playlist || lyrics){
                                                self.playlist = false
                                                self.lyrics = false
                                                self.playerState = CGSize.zero
                                            }

                                            else if (value.startLocation.y - value.location.y) >= 70 && !lyrics{
                                                self.playlist = true
                                                self.playerState = CGSize.zero
                                            }

                                            else if (value.location.y - value.startLocation.y) >= 120 {
                                                self.musictapped = false
                                                self.playerState = CGSize.zero
                                                self.playlist = false
                                                self.lyrics = false
                                            }

                                            else {
                                                self.playerState = CGSize.zero
                                            }
                                        }
                                        self.playerState = CGSize.zero
                                    }
                        )
        )
        .offset(y: musictapped ? playerState.height : 0)
    }
}

struct BottomBarMusic_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarMusic(musictapped: .constant(false), shuffle: .constant(false), repeatSong: .constant(false))
    }
}
