//
//  CustomAdditionalButton.swift
//  StreamingApp
//
//  Created by Nils Fauvain on 17.05.21.
//

import SwiftUI

struct CustomAdditionalButtonPreset: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var buttonToggled: Bool
    
    var icon: Bool
    var text: Bool
    
    var buttonIconName: String
    var buttonText: String
    
    var buttonTextIconColor: Color
    var buttonTextIconSize: Int
    
    var buttonFramex: Int
    var buttonFramey: Int
    
    var buttonCornerRadius: Int
    
    var buttonStrokeColor: Color
    var buttonBackgroudColor: Color
    
    var buttonRectangleFill: Bool
    var buttonRectangleStroke: Bool
    var buttonCircleFill: Bool
    var buttonCircleStroke: Bool
    
    // For Buttons that don't switch background use .constant(true)
    
    var body: some View{

            ZStack {
                
                if buttonRectangleFill {
                        RoundedRectangle(cornerRadius: CGFloat(buttonCornerRadius))
                            .foregroundColor(buttonToggled ? buttonBackgroudColor : Color(colorScheme == .dark ? .black : .white))
                            .frame(width: CGFloat(buttonFramex), height: CGFloat(buttonFramey))
                }
                
                if buttonRectangleStroke {
                        RoundedRectangle(cornerRadius: CGFloat(buttonCornerRadius))
                            .stroke(buttonToggled ? buttonBackgroudColor : .white, lineWidth: 1)
                            .frame(width: CGFloat(buttonFramex), height: CGFloat(buttonFramey))
                }
                
                if buttonCircleFill {
                        Circle()
                            .foregroundColor(buttonToggled ? buttonBackgroudColor : Color(colorScheme == .dark ? .black : .white))
                            .frame(width: CGFloat(buttonFramex), height: CGFloat(buttonFramey))
                }
                
                if buttonCircleStroke {
                        Circle()
                            .stroke(buttonToggled ? buttonBackgroudColor : .white, lineWidth: 1)
                            .frame(width: CGFloat(buttonFramex), height: CGFloat(buttonFramey))
                }
                
                if icon {
                    Image(systemName: buttonIconName).font(.system(size: CGFloat(buttonTextIconSize), weight: .regular))
                    .foregroundColor(buttonTextIconColor)

                }
                
                if text {
                    Text(buttonText)
                        .font(.system(size: CGFloat(buttonTextIconSize), design: .rounded))
                        .foregroundColor(buttonTextIconColor)
                }
            }
    }
}

struct CustomAdditionalButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomAdditionalButtonPreset(buttonToggled: .constant(true), icon: true, text: false, buttonIconName: "play.fill", buttonText: "ButtonTest", buttonTextIconColor: .black, buttonTextIconSize: 20, buttonFramex: 120, buttonFramey: 25, buttonCornerRadius: 10, buttonStrokeColor: .blue, buttonBackgroudColor: .blue.opacity(0.3), buttonRectangleFill: true, buttonRectangleStroke: false, buttonCircleFill: false, buttonCircleStroke: false)
    }
}
