//
//  Home.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/12/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
            VStack{
                Spacer()
                Text("What would you like to do?")
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination:
                                    ArtScroll()){
                        Text("Sort by art movement")
                    }
                    Spacer()
                    NavigationLink(destination:
                                    ArtScroll()){
                        Text("Test Your Knowledge")
                    }
                    Spacer()
                    NavigationLink(destination:
                                    ArtScroll()){
                        Text("Flashcards")
                    }
                    Spacer()
                }
                Spacer()
            }
        
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
