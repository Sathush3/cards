//
//  ContentView.swift
//  cards
//
//  Created by Sathurshan Ramachandran on 2022-10-10.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    var cardData:[Card] = cards
    
    // MARK: - Content
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 30){
                ForEach(cardData) { item in
                   CardView(card: item)
                }
            }
            .padding(30)
           
        
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardData: cards)
    }
}
