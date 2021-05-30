//
//  MoviesContent.swift
//  StreamingApp (iOS)
//
//  Created by Nils Fauvain on 19.05.21.
//

import SwiftUI


struct MovieTemplate: Identifiable {
    
    var id = UUID()
    var movieTitle: String
}

let moviesData = [
    MovieTemplate(movieTitle: "Django Unchained"),
    MovieTemplate(movieTitle: "Inception"),
    MovieTemplate(movieTitle: "Dark Shadows"),
    MovieTemplate(movieTitle: "Fight Club"),
    MovieTemplate(movieTitle: "James Bond"),
    MovieTemplate(movieTitle: "Pirates Of The Carabbean")
]

let seriesData = [
    MovieTemplate(movieTitle: "Avatar: The Last Airbender"),
    MovieTemplate(movieTitle: "Avatar: The Legend Of Corra"),
    MovieTemplate(movieTitle: "Sex Education"),
    MovieTemplate(movieTitle: "La Casa De Papel")
]

struct MoviesContent: View {
    
    @State var movies = true
    @State var series = false
    
    var body: some View {
        VStack{
            // Top Bar
            HStack{
                
                Spacer()
                
                Button(action: {
                    self.movies = true
                    self.series = false
                }, label: {
                    CustomAdditionalButtonPreset(buttonToggled: $movies, icon: false, text: true, buttonIconName: "", buttonText: "Movies", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 0.792324576, green: 1, blue: 0.8288285359, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
                
                Button(action:{
                    self.movies = false
                    self.series = true
                }, label: {
                        CustomAdditionalButtonPreset(buttonToggled: $series, icon: false, text: true, buttonIconName: "", buttonText: "Series", buttonTextIconColor: .primary, buttonTextIconSize: 18, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .black, buttonBackgroudColor: Color(#colorLiteral(red: 0.792324576, green: 1, blue: 0.8288285359, alpha: 1)).opacity(0.5), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
                })
                
                Spacer()
            }
            .padding(.bottom)
            
            ZStack {
                
                // Movies
                if movies {
                    List(moviesData) { movie in
                        Text(movie.movieTitle).font(.system(size: 18, weight: .semibold, design: .rounded))
                    }
                }
                
                // Series
                if series {
                    List(seriesData) { movie in
                        Text(movie.movieTitle).font(.system(size: 18, weight: .semibold, design: .rounded))
                    }
                }
            }
        }
    }
}

struct MoviesContent_Previews: PreviewProvider {
    static var previews: some View {
        MoviesContent()
    }
}
