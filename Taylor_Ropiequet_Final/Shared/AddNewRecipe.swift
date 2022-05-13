//
//  AddNewRecipe.swift
//  Taylor_Ropiequet_Final
//
//  Created by Taylor Ropiequet on 4/28/22.
//

import SwiftUI

struct AddNewRecipe: View {
    @ObservedObject var recipeStore : RecipeStore
    @State private var name: String = ""
    @State private var imageName: String = ""
    @State private var ingredientsText: String = "Enter ingredients here"
    @State private var instructionsText: String = "Enter instructions here"
    
    @State private var shouldTransit: Bool = false
    @State private var hideButton: Bool = false
        
    
    
    @State private var selectedCategory = "None"
    let categories = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("New Recipe")) {
                    Image("recipe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    TextField("Recipe Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.body)
                    TextEditor(text: $ingredientsText)
                        .font(.body)
                    TextEditor(text: $instructionsText)
                        .font(.body)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .padding(.top, 0)
                    }
                }
                
                NavigationLink(destination: ContentView(recipeStore: recipeStore).navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), isActive: $shouldTransit){
                    Text("Add Recipe")
                        .foregroundColor(.blue)
                        .onTapGesture{
                            self.addNewRecipe()
                            self.shouldTransit = true
                            self.hideButton = true
                        }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)

                NavigationLink(destination: ContentView(recipeStore: recipeStore).navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)){
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    
    func addNewRecipe() {
        let ingredients = ingredientsText.components(separatedBy: "\n")
        let instructions = instructionsText.components(separatedBy: "\n")
        switch selectedCategory {
        case "Breakfast":
            imageName = "Breakfast"
        case "Lunch":
            imageName = "Lunch"
        case "Dinner":
            imageName = "Dinner"
        case "Dessert":
            imageName = "Dessert"
        default:
            imageName = "recipe"
        }
        let newRecipe = Recipe(id: UUID().uuidString,
                               name: name, ingredients: ingredients, instructions: instructions, category: selectedCategory, imageName: imageName)
        recipeStore.recipes.append(newRecipe)
    }
}
    
    

struct AddNewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipe(recipeStore: RecipeStore(recipes: recipeData))
    }
}


struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}






    
    

