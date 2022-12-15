//
//  ArtScroll.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/12/22.
//

import SwiftUI

var impressionistList: [FlashCard] = [
    FlashCard(
        description: "Impression, Sunrise Claude Monet ; 1872 Musée Marmottan Monet in Paris, France", name: "impressionSunrise"
    ),
    FlashCard(
        description: "Luncheon Of The Boating Party/ Pierre-Auguste Renoir 1880 (Located in the Phillips Collection in Washington DC)" ,name: "impressionPierre"
    ),
    FlashCard(
        description: "A Cotton Office In New Orleans/ Edgar Degas 1873 Location: Museum in Pau, France" , name: "impressionCotton"
    ),
    FlashCard(description: "Paris Street In Rainy Weather/by Gustave Caillebotte 1877 Loc: The Art Institute of Chicago", name: "impressionGustave"
    ),
    FlashCard(description: "Dance At The Moulin De La Galette/Pierre-Auguste Renoir 1876 Location: Private Collection", name: "impressionAuguste"
    ),
    FlashCard(description: "Boulevard Montmartre Spring/Camille Pissarro 1897 Location: Museum Langmatt in Baden, Switzerland", name: "impressionCamille"),
    FlashCard(description: "The Japanese Bridge / Claude Monet 1899 Location: Princeton University Art Museum", name: "impressionBridge"
    ),
    FlashCard(description: "The Dance Class /Degas, 1874 Location: Metropolitan Museum of Art, New York, NY", name: "impressionDance"
    ),
    FlashCard(description: "Water Lilies (Monet, 1906 Located: Ohara Museum of Art Okayama, Japan", name: "impressionWaterlily"
    ),
    FlashCard(description: "Gare Saint-Lazare (Monet, 1877) Location: National Gallery Of Art Location: Cambridge Massachussets", name: "impressionMass"),
    FlashCard(description: "The Coiffure by Mary Cassatt, 1890 Location: National Gallery of Art , Washington, DC", name: "impressionDC" ),
    FlashCard(description: "The Absinthe Drinker /Degas 1876 Location: Musée d'Orsay , Paris, France", name: "impressionDrinker")

]

var earlyRenaisanceList: [FlashCard] = [
    FlashCard(description: "no description", name: "earlRenMadonna" ),
    FlashCard(description: "no description", name: "earlRenVenus" ),
    FlashCard(description: "no description", name: "earlRenPrimavera" ),
    FlashCard(description: "no description", name: "earlRenCapella" ),
    FlashCard(description: "no description", name: "earlRenAngelico" ),
    FlashCard(description: "no description", name: "earlRenPierro" ),
    FlashCard(description: "no description", name: "earlRenGeorge" ),
    FlashCard(description: "no description", name: "earlRenMessina" ),
    FlashCard(description: "no description", name: "earlRenChrist" ),
    FlashCard(description: "no description", name: "earlRenAgony" ),
    FlashCard(description: "no description", name: "earlRenPaolo" )
    ]



var byzantineList: [FlashCard] = [

]

var masterList: [FlashCard] = []

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
//    @State private var showingAlert = masterList.isEmpty
    @State var switchView: Bool = false
    @State var showAlert: Bool = false
    @State private var showFlash = false
    @State var masList = masterList
    @State private var path = NavigationPath()
    
    @State var list: [String] = []
    var body: some View {
        ScrollView {
            VStack {
                
//                NavigationLink(destination: slideAnimator()) {
//                                Text("slide")
//                }
                
                
                
                NavigationLink(destination: FlashCardGame()) {
                                Text("FlashGame")
                }.disabled(masList.isEmpty)
                
        
           
                
//                Button("FlashCardGame") {
//                    if masterList.isEmpty{
//                        showingAlert = true
//                    }
//                    else{
//
//                    }
//                }
//                        .alert(isPresented:$showingAlert) {
//                            Alert(
//                                title: Text("Pick a cetegory"),
//                                message: Text(""),
//                                dismissButton: .destructive(Text("Okay")) {
//                                    print("Deleting...")
//                                }
//                            )
//                        }
//
              
                Spacer()
                HStack{
                    Spacer()
                        Button(action: {
                            if(!masterList.contains(impressionistList)){
                                masterList.append(contentsOf: impressionistList)
                                masList.append(contentsOf: impressionistList)
                                print(masterList.count)
                            } else {
                                masList = masList.filter{
                                    !impressionistList.contains($0)
                                }
                                masterList = masterList.filter {
                                    !impressionistList.contains($0)
                                }
                            }
                        }, label: {
                            Text("Impressionism")
                        }
                    ).onAppear(perform: {
                            playSound(sound: "zmusic", type: "mp3")
                        })
                    Spacer()
                    Button(action: {
                        if(!masterList.contains(earlyRenaisanceList)){
                            masterList.append(contentsOf: earlyRenaisanceList)
                            masList.append(contentsOf: earlyRenaisanceList)
                        } else {
                            masList = masList.filter{
                                !earlyRenaisanceList.contains($0)
                            }
                            masterList = masterList.filter {
                                !earlyRenaisanceList.contains($0)
                            }
                        }
                    }, label: {
                        Text("earlyRenaisanceList")
                    }
                )
                    Spacer()
                    Button(action: {
                        if(!masterList.contains(byzantineList)){
                            masterList.append(contentsOf: byzantineList)
                            masList.append(contentsOf: byzantineList)
                        } else {
                            masList = masList.filter{
                                !byzantineList.contains($0)
                            }
                            masterList = masterList.filter{
                                !byzantineList.contains($0)
                            }
                        }
                    }, label: {
                        Text("Byzantine")
                    }
                )
                Spacer()
                    
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

