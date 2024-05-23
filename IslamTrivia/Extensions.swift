//
//  Extensions.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import Foundation
import SwiftUI

extension Text{
    func lightBrownTitle() -> some View{
        self.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
    }
    
    func lightBrownParagraph() -> some View{
        self.foregroundColor(Color("TextColor"))
    }
    
    func lightBrownNameToGuess() -> some View{
        self.foregroundColor(Color("TextColor"))
            .bold()
            .font(.system(size: 40))
    }
}

extension VStack{
    func darkGreenView() -> some View{
        self.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("BackgroundColor"))
    }
}
