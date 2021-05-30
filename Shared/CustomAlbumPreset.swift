//
//  CustomAlbumPreset.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI

struct CustomAlbumPreset: View {
    
    var rectangle: Bool
    var circle: Bool
    
    var albumIconName: String
    var albumName: String
    var albumArtist: String
    
    var albumNameBGColor: Color
    var albumNameIconSize: Int
    
    var albumFrame: Int
    
    var albumCornerRadius: Int
    
    var albumStrokeColor: Color
    
    var albumCover: Image
    
    // Implement !!
    var albumRectangleStroke: Bool
    var albumCircleStroke: Bool
    
    var body: some View {
        
        ZStack {
            
            // Rectangle Shape
            if rectangle {
                VStack(spacing: 0) {
                    albumCover
                        .resizable()
                        .frame(width: CGFloat(albumFrame), height: CGFloat(albumFrame))
                    
                    VStack {
                        Text(albumName)
                            .font(.system(size: CGFloat(albumNameIconSize), weight: .semibold, design: .rounded))
                        
                        Text(albumArtist)
                            .font(.system(size: CGFloat(albumNameIconSize), weight: .light, design: .default))
                    }
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: CGFloat(albumFrame), height: 50)
                    .background(albumNameBGColor)
                    .truncationMode(.tail)
                    
                }
                .cornerRadius(CGFloat(albumCornerRadius))
                .overlay(RoundedRectangle(cornerRadius: CGFloat(albumCornerRadius))
                            .stroke(albumStrokeColor, lineWidth: 2))
                .shadow(color: .black.opacity(0.3), radius: 4)
            }
            
            // Circle View
            if circle {
                VStack {
                    albumCover
                        .resizable()
                        .frame(width: CGFloat(albumFrame), height: CGFloat(albumFrame))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(albumStrokeColor, lineWidth: 2))
                        .shadow(color: .black.opacity(0.3), radius: 4)
                    
                    VStack {
                        Text(albumName)
                            .font(.system(size: CGFloat(albumNameIconSize), weight: .semibold, design: .rounded))
                        
                        Text(albumArtist)
                            .font(.system(size: CGFloat(albumNameIconSize), weight: .light, design: .default))
                    }
                    .padding()
                    .frame(width: CGFloat(albumFrame+50), height: 50)
                    .truncationMode(.tail)
//                    .shadow(color: .black.opacity(0.1), radius: 3)
                }
                .padding()
            }
        }
    }
}

struct CustomAlbumPreset_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlbumPreset(rectangle: false, circle: true, albumIconName: "", albumName: "Blackest Blue", albumArtist: "Morcheeba", albumNameBGColor: Color(#colorLiteral(red: 0.01660714587, green: 0, blue: 0.3269315126, alpha: 1)), albumNameIconSize: 18, albumFrame: 100, albumCornerRadius: 10, albumStrokeColor: .black, albumCover: Image("Sticky Fingers"), albumRectangleStroke: true, albumCircleStroke: false)
    }
}
