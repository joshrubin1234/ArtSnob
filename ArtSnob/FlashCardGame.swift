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
            let list = masterList[bigCounter]
            let element = list[counter]
            Image(element.name).resizable().scaledToFit()
            
            Button(action: {
                if counter == list.count-1 && bigCounter < masterList.count-1{
                    counter = -1
                    bigCounter = bigCounter + 1
                    print("counter: ", counter)
                }
                if bigCounter == masterList.count-1 && counter == list.count-1{
                    bigCounter = 0
                    counter = -1
                }
                
                counter = counter + 1
                
                print("masterlist: ", masterList.count)
                print("counter: ", counter)
                print("bigCounter: ", bigCounter)
                print("list size: ", list.count)
                

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
