//
//  TestFlash.swift
//  ArtSnob
//
//  Created by Josh Rubin on 11/18/22.
//

import SwiftUI

var counter = 0


struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
   
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
                
            }, label: {
                Image("leftArrow").resizable().scaledToFit().frame(width:100).frame(height: 100)
            })
            ZStack {
                let flashCard = masterList[counter]
                Image(flashCard.name).resizable().scaledToFit()
                
            }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            
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

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double


    var body: some View {
        

        ZStack {
           
            
            let flashCard = masterList[counter]
            Text(flashCard.description)
            

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct TestFlash: View {
    //MARK: Variables
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false

    let width : CGFloat = 400
    let height : CGFloat = 275
    let durationAndDelay : CGFloat = 0.3

    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        ZStack {
            CardFront(width: width, height: height, degree: $frontDegree)
            CardBack(width: width, height: height, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
}
