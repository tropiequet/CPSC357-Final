//
//  RecipeData.swift
//  Taylor_Ropiequet_Final
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import UIKit
import SwiftUI


var recipeData: [Recipe] = loadJson("recipeData.json")


func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename,withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
