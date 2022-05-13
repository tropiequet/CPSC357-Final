//
//  Recipe.swift
//  Taylor_Ropiequet_Final
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI


struct Recipe : Codable, Identifiable {
    var id: String
    var name: String
    var ingredients: [String]
    var instructions: [String]
    var category: String
    var imageName: String
}
