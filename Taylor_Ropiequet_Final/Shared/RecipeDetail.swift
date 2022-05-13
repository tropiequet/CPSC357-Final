//
//  RecipeDetail.swift
//  Taylor_Ropiequet_Final
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI

struct RecipeDetail: View {
    @State private var selection = 1
    let selectedRecipe: Recipe
    var body: some View {
        TabView(selection: $selection) {
            Form {
                Section(header: Text(selectedRecipe.name)) {
                    Image(selectedRecipe.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    ForEach (selectedRecipe.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .font(.body)
                    }

                }
            }
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Ingredients")
                }.tag(1)
            Form {
                Section(header: Text(selectedRecipe.name)) {
                    Image(selectedRecipe.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    ForEach (selectedRecipe.instructions, id: \.self) { instruction in
                        Text(instruction)
                            .font(.body)
                    }

                }
            }
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Instructions")
                }.tag(2)
        }
        .font(.largeTitle)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(selectedRecipe: recipeData[0])
    }
}


