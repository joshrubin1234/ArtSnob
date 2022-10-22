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
        description: "Luncheon Of The Boating Party/ Pierre-Auguste Renoir 1880 (Located in the Phillips Collection in Washington DC)" ,name: "pierreImpression"
    ),
    FlashCard(
        description: "A Cotton Office In New Orleans/ Edgar Degas 1873 Location: Museum in Pau, France" , name: "cottonImpression"
    ),
    FlashCard(description: "Paris Street In Rainy Weather/by Gustave Caillebotte 1877 Loc: The Art Institute of Chicago", name: "gustaveImpression"
    )
    
    
    
]

var nihlistList: [FlashCard] = [
    FlashCard(description: "Dance At The Moulin De La Galette/Pierre-Auguste Renoir 1876 Location: Private Collection", name: "augusteImpression"
    ),
    FlashCard(description: "Boulevard Montmartre Spring/Camille Pissarro 1897 Location: Museum Langmatt in Baden, Switzerland", name: "camilleImpression"),
    FlashCard(description: "The Japanese Bridge / Claude Monet 1899 Location: Princeton University Art Museum", name: "bridgeImpression"
    ),
    FlashCard(description: "The Dance Class /Degas, 1874 Location: Metropolitan Museum of Art, New York, NY", name: "danceImpression"
    )
    ]
    


var cheaList: [FlashCard] = [
    FlashCard(description: "Water Lilies (Monet, 1906 Located: Ohara Museum of Art Okayama, Japan", name: "waterlilyImpression"
    ),
    FlashCard(description: "Gare Saint-Lazare (Monet, 1877) Location: National Gallery Of Art Location: Cambridge Massachussets", name: "massImpression"),
    FlashCard(description: "The Coiffure by Mary Cassatt, 1890 Location: National Gallery of Art , Washington, DC", name: "dcImpression" ),
    FlashCard(description: "The Absinthe Drinker /Degas 1876 Location: Musée d'Orsay , Paris, France", name: "drinkerImpression")
]

var masterList: [[FlashCard]] = []
var masterListCopy = [nihlistList, cheaList, impressionistList]
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
                            if(!masterList.contains(impressionistList)){
                                masterList.append(impressionistList);print(masterList)
                            } else {
                                masterList.removeAll(where: {$0 == impressionistList});print(masterList)
                            }
                        }, label: {
                            Text("Impressionism")
                        }
                    )
                    Spacer()
                    Button(action: {
                        if(!masterList.contains(nihlistList)){
                            masterList.append(nihlistList);print(masterList)
                        } else {
                            masterList.removeAll(where: {$0 == nihlistList});print(masterList)
                        }
                    }, label: {
                        Text("nihlist")
                    }
                )
                    Spacer()
                    Button(action: {
                        if(!masterList.contains(cheaList)){
                            masterList.append(cheaList);print(masterList)
                        } else {
                            masterList.removeAll(where: {$0 == cheaList});print(masterList)
                        }
                    }, label: {
                        Text("CHEA")
                    }
                )
                    
                    
                }
                NavigationLink(destination:
                                FlashCardGame()){
                    Text("FlashcardGame")
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

