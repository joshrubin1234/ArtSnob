//
//  ArtScroll.swift
//  ArtSnob
//
//  Created by Josh Rubin on 10/12/22.
//

import SwiftUI

struct ArtScroll: View {
    var preRenaissanceList: [String] = ["pre", "pre"]
    var earlyRenaissanceList: [String] = ["ear", "ear"]
    e m
    @State var list: [String] = []
    
    var body: some View {
        
        ScrollView {
            HStack{
                if(!list.contains(preRenaissanceList)){
                    Button(action: {
                        list.append(contentsOf: preRenaissanceList);print(list);
                    },label: {
                        Text("Pre-renissance")
                    })
                }
                else{
                    
                    Button(action: {
                        list = list.filter{!preRenaissanceList.contains($0)};print(list)
                    },label: {
                        Text("Pre-renissance")
                    })
                }
                if(!list.contains(earlyRenaissanceList)){
                    Button(action: {
                        list.append(contentsOf: earlyRenaissanceList);print(list);
                    },label: {
                        Text("early-renissance")
                    })
                }
                else{
                    Button(action: {
                        list = list.filter{!earlyRenaissanceList.contains($0)};print(list)
                    },label: {
                        Text("early-renissance")
                    })
                }
                

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
