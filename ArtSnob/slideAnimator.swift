////
////  slideAnimator.swift
////  ArtSnob
////
////  Created by Josh Rubin on 12/5/22.
////
//
//import Foundation
//import SwiftUI
//
//var counter1 = 0
//
//
//struct CardFront1 : View {
//    let width : CGFloat
//    let height : CGFloat
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                           .fill(.white)
//                           .frame(width: width, height: height)
//                           .shadow(color: .gray, radius: 2, x: 0, y: 0)
//            let flashCard = masterList[counter]
//            Text(flashCard.description).frame(width: width, height: height)
//            
//            Spacer()
//        }
//            
//        
//        
//    }
//}
//
//struct CardBack1 : View {
//    let width : CGFloat
//    let height : CGFloat
//
//
//
//    var body: some View {
//        
//        
//        ZStack {
//           
//            
//            RoundedRectangle(cornerRadius: 20)
//                           .fill(.white)
//                           .frame(width: width, height: height)
//                           .shadow(color: .gray, radius: 2, x: 0, y: 0)
//
//            let flashCard = masterList[counter]
//            
//            Image(flashCard.name).resizable().scaledToFit().frame(width: width, height: height)
//             
//            Spacer()
//
//        }
//        
//
//        ZStack {
//           
//            
//            RoundedRectangle(cornerRadius: 20)
//                           .fill(.white)
//                           .frame(width: width, height: height)
//                           .shadow(color: .gray, radius: 2, x: 0, y: 0)
//
//            let flashCard = masterList[counter]
//            Image(flashCard.name).resizable().scaledToFit().frame(width: width, height: height)
//             
//            Spacer()
//
//        }
//        
//           
//    }
//}
//
//struct slideAnimator: View {
//    //MARK: Variables
//    @State var slide: Bool = false
////    @State var isPressed = false
//    let width : CGFloat = 400
//    let height : CGFloat = 275
//
//    
//
//
//    //MARK: Slide Card Function
//    
//    //MARK: View Body
//    var body: some View {
//        let flashCard = masterList[counter]
//        VStack{
//            Text("Flashcards").fontWeight(.bold).underline().font(.title)
//        }
//            HStack{
//                
//                Button(action: {
//                    slide.toggle()
//                    if counter > 0{
//                        counter = counter - 1
//                    }
//                    else{
//                        counter = masterList.count
//                        counter = counter - 1
//                    }
//                    
//             
//                }, label: {
//                    Image("leftArrow").resizable().scaledToFit().frame(width:100).frame(height: 100)
//                })
//                if slide {
//                    CardFront1(width: width, height: height)
//                        .transition(.move(edge: .leading))
//                        .animation(.easeIn(duration: 1.0))
//                }
//                Spacer()
//                ZStack {
//
//                    CardFront1(width: width, height: height)
//                    CardBack1(width: width, height: height)
//                    
//                  
//               
//                }
//                Spacer()
//            Button(action: {
//                slide.toggle()
//                if counter == masterList.count-1{
//                    counter = -1
//                    
//                }
//                counter = counter + 1
//                
//                print("masterlist: ", masterList.count)
//                print("counter: ", counter)
//             
//                
//             
//                
//            }, label: {
//                Image("rightArrow").resizable().scaledToFit().frame(width: 100).frame(height: 100)
//                
//                
//            })
//                if slide {
//                    CardBack1(width: width, height: height)
//                        .transition(.move(edge: .trailing))
//                }
//        }
//        
//    }
//}
