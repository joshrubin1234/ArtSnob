//
//  ArtScroll.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/12/22.
//

import SwiftUI

var impressionistList: [FlashCard] = [
    FlashCard(
        description: "Impression, Sunrise Claude Monet ; 1872 Musée Marmottan Monet in Paris, France", name: "sunriseImpression"
    ),
    FlashCard(
        description: "Luncheon Of The Boating Party/ Pierre-Auguste Renoir 1880 (Located in the Phillips Collection in Washington DC)" , name: "pierreImpression"
    ),
    FlashCard(
        description: "A Cotton Office In New Orleans/ Edgar Degas 1873 Location: Museum in Pau, France" , name: "cottonImpression"
    )
    
]

var nihlistList: [FlashCard] = [
    FlashCard(
        description: "nihlist post-modernest nihlist post-modernAYYYYY", name: "nihlist"
    ),
    FlashCard(
        description: "nihlist post-modernest nihlist post-modernAYYYYY" , name: "nihlist"
    ),
    FlashCard(
        description: "nihlist post-modernest nihlist post-modernAYYYYY" , name: "nihlist"
    )
    
]

var cheaList: [FlashCard] = [
    FlashCard(
        description: "chea chicky cheea chicky chicky chea chea ", name: "motherfuckin chea"
    ),
    FlashCard(
        description: "chea chicky cheea chicky chicky chea chea " , name: "motherfuckin chea"
    ),
    FlashCard(
        description: "chea chicky cheea chicky chicky chea chea " , name: "motherfuckin chea"
    )
]

var masterList: [[FlashCard]] = []

struct FlashCard {
    var description = ""
    var name = ""
}

extension FlashCard: Equatable {
    static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
        if(lhs.name == rhs.name && lhs.description == rhs.description){
            return true
        }
        return false
            
    }
}

    

struct ArtScroll: View {
   
    @State var list: [String] = []
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                HStack{
                    Spacer()
                        Button(action: {
                            if (!masterList.contains(impressionistList)){
                                masterList.append(impressionistList)
                            } else {
                                masterList.removeAll(where: {$0 == impressionistList})
                            }
                        }, label: {
                            Text("Impressionism")
                        }
                    )
                }
            }
            .padding()
        }
    }
    
    struct ArtScroll_Previews: PreviewProvider {
        static var previews: some View {
            ArtScroll()
        }
    }
}

