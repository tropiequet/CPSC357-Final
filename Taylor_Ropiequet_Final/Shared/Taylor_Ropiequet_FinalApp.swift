//
//  Taylor_Ropiequet_FinalApp.swift
//  Shared
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI

@main
struct Taylor_Ropiequet_FinalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(recipeStore: RecipeStore(recipes: recipeData))
            //ContentView()
        }
    }
}
