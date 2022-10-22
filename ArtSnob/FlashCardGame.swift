//
//  FlashCardGame.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/21/22.
//

import SwiftUI

struct FlashCardGame: View {
    var body: some View {
        HStack{
            let list = masterList[0]
            let listo = list[0]
            Image(listo.name).resizable().scaledToFit()
            
        }
    }
}

struct FlashCardGame_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardGame()
    }
}
