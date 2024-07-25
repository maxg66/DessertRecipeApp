//
//  RecipeListView.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/23/24.
//

import SwiftUI

struct RecipeListView: View {

    @EnvironmentObject var viewModel: RecipeListViewModel

    var body: some View {
        NavigationStack {
            Text("Dessert Recipes")
                .font(.title)
            List {
                ForEach(viewModel.recipeList, id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetailsView().environmentObject(RecipeDetailsViewModel(mealID: recipe.id))) {
                        HStack {
                            if let imageURL = URL(string: recipe.imageURL) {
                                AsyncImage(url: imageURL) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 75, height: 75)
                            }
                            
                            Text(recipe.mealTitle.capitalized)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}
