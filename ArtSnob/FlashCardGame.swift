//
//  FlashCardGame.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/21/22.
//

import SwiftUI

struct FlashCardGame: View {
    @State private var counter = 0
    @State private var degrees = 0.0
    @State private var flipped = false
    
      
    

    var body: some View {
        
        HStack{
            
            
            Button(action: {
                if counter > 0{
                    counter = counter - 1
        
                }
                else{
                    counter = masterList.count
                    counter = counter - 1
                }
                
                
                print("masterlist: ", masterList.count)
                print("counter: ", counter)
    
              

            }, label: {
                Image("leftArrow").resizable().scaledToFit().frame(width:100).frame(height: 100)
            })
            
            
            let flashCard = masterList[counter]
            
            
   
                  Image(flashCard.name).resizable().scaledToFit()
                
        
                    
      
            
            
//            Image(flashCard.name).resizable().scaledToFit().rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
//
            
            
            
            Button(action: {
                if counter == masterList.count-1{
                    counter = -1
        
                }
                counter = counter + 1
                
                print("masterlist: ", masterList.count)
                print("counter: ", counter)
    
              

            }, label: {
                Image("rightArrow").resizable().scaledToFit().frame(width: 100).frame(height: 100)
            
            
        })
      
                   }
    }
}

struct FlashCardGame_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardGame()
       
    }
}
