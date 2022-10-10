//
//  CardModel.swift
//  cards
//
//  Created by Sathurshan Ramachandran on 2022-10-10.
//

import SwiftUI

// MARK: - card model

struct Card: Identifiable{
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
    
    
}
