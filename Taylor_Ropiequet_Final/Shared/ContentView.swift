//
//  ContentView.swift
//  Shared
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recipeStore : RecipeStore
    @State private var selection = 1
    @State private var category: String = "Recipes"
    let categories = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    @State private var isHidden = false
    @State private var title: String = ""
    @State private var add: String = ""
    @State private var edit: String = ""
    var body: some View {
        NavigationView {
            TabView(selection: $selection){
                List {
                    ForEach (recipeStore.recipes) { recipe in
                        ListCell(recipe: recipe)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                    .navigationBarHidden(isHidden)
                    .onAppear{
                        isHidden = false
                        self.title = "Recipes"
                        self.add = "Add"
                        self.edit = "Edit"
                    }
                }.tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(1)
                
                
                List {
                    ForEach (categories, id: \.self) { category in
                        NavigationLink(destination: CategoryView(category: category, recipeStore: recipeStore)){
                            HStack {
                                Image(category)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 60)
                                Text(category)
                            }
                        }
                        
                    }
                    .navigationBarHidden(isHidden)
                    .onAppear{
                        isHidden = false
                        self.title = "Categories"
                        self.add = ""
                        self.edit = ""
                    }

                }.tabItem{
                    Image(systemName: "chart.pie")
                    Text("Category")
                }.tag(2)
            }
            
            .navigationBarTitle(Text(title), displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: AddNewRecipe(recipeStore: self.recipeStore)) {
                    Text(add)
                        .foregroundColor(.blue)
            }, trailing:barItems())
            
        }
        .environmentObject(recipeStore)
        
    }
    func deleteItems(at offsets: IndexSet) {
        recipeStore.recipes.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        recipeStore.recipes.move(fromOffsets: source, toOffset: destination)
    }

    func barItems() -> some View {
        return Group {
            if edit == "Edit" {
                EditButton()
            } else {
                Button(""){
                    print("")
                }
            }
        }
    }
}


struct ListCell: View {
    var recipe: Recipe
    @State private var selection = 1
    var body: some View {
        NavigationLink(destination: RecipeDetail(selectedRecipe: recipe)){
            HStack {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(recipe.name)
            }
        }
    }
}


struct CategoryView: View {
    var category: String
    var recipeStore: RecipeStore
    @State private var selection = 1
    var body: some View {
        List{
            ForEach (recipeStore.recipes) { recipe in
                if (recipe.category == category){
                    ListCell(recipe: recipe)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipeStore: RecipeStore(recipes: recipeData))

    }
}

