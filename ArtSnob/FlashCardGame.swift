//
//  FlashCardGame.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/21/22.
//

import SwiftUI

struct FlashCardGame: View {
    @State private var bigCounter = 0
    @State private var counter = 0
    var body: some View {
    
        HStack{
//            Button(action: masterList.forEach{ list in
//                list.forEach{ flashcard in
//                    Image(flashcard.name).resizable().scaledToFit()
//                }
//            }, label: {
//                Text("->")
//            })
//
            var list = masterList[bigCounter]
            var element = list[counter]
            Image(element.name).resizable().scaledToFit()
            
            Button(action: {
                if counter == list.count - 1{
                    counter = 0
                    bigCounter += bigCounter
                }
                counter = counter + 1

            }, label: {
                Text("->")
            })
        
            
        }
      
       
    }
}

struct FlashCardGame_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardGame()
    }
}
