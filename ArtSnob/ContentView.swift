//
//  ContentView.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/12/22.
//

import SwiftUI
struct ContentView: View {
    @State private var ShowHome = false
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                Text("Art Snob")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: Home()){
                    Text("Shall We?")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
