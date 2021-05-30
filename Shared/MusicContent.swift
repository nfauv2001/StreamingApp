//
//  MusicContent.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct AlbumTemplate: Identifiable {
    
    var id = UUID()
    var albumName: String
    var albumArtist: String
}

let musicsData = [
    AlbumTemplate(albumName: "Blackest Blue", albumArtist: "Morcheeba"),
    AlbumTemplate(albumName: "True Indeed", albumArtist: "The Soundmakers"),
    AlbumTemplate(albumName: "Sticky Fingers", albumArtist: "The Rolling Stones")
]

struct MusicContent: View {
    @State var artists = false
    @State var albums = true
    
    var body: some View {
        VStack{
            // Top Bar
            HStack{
                
                Spacer()
                
                Button(action: {
                    self.artists = true
                    self.albums = false
                }, label: {
                    CustomAdditionalButtonPreset(buttonToggled: $artists, icon: false, text: true, buttonIconName: "", buttonText: "Artists", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 1, green: 0.6828393124, blue: 0.7556319446, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
                
                Button(action:{
                    self.artists = false
                    self.albums = true
                }, label: {
                        CustomAdditionalButtonPreset(buttonToggled: $albums, icon: false, text: true, buttonIconName: "", buttonText: "Albums", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 1, green: 0.6828393124, blue: 0.7556319446, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
            }
            .padding(.bottom)
            
            ZStack {
                
                // Artists
                if artists {
                    List(musicsData){ artist in
                        HStack{
                            Image(artist.albumName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            Text(artist.albumArtist).font(.system(size: 16, weight: .semibold, design: .rounded))
                                .padding(.leading)
                        }
                    }
                }
            
            // Albums
            if albums {
                ScrollView(showsIndicators: false) {
                    ForEach(musicsData) { album in
                        CustomAlbumPreset(rectangle: false, circle: true, albumIconName: "", albumName: album.albumName, albumArtist: album.albumArtist, albumNameBGColor: Color(#colorLiteral(red: 0.01876720236, green: 0, blue: 0.369454806, alpha: 1)), albumNameIconSize: 15, albumFrame: 100, albumCornerRadius: 10, albumStrokeColor: .blue, albumCover: Image(album.albumName), albumRectangleStroke: true, albumCircleStroke: false)
                    }
                }
            }
        }
    }
}
}

struct MusicContent_Previews: PreviewProvider {
    static var previews: some View {
        MusicContent()
    }
}
