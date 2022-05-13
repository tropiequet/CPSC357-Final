//
//  RecipeStore.swift
//  Taylor_Ropiequet_Final
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI
import Combine


class RecipeStore : ObservableObject {
    @Published var recipes: [Recipe]
    init (recipes: [Recipe] = []) {
        self.recipes = recipes
        
    }
}
