//
//  RecipeListViewModel.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/23/24.
//

import Foundation

class RecipeListViewModel: ObservableObject {

    @Published private(set) var recipeList: [RecipeListItem] = []
    private let communicator = RecipeCommunicator()

    init() {
        loadRecipeList()
    }

    func loadRecipeList() {
        Task {
            let recipes = await communicator.loadRecipeList()
            await MainActor.run {
                recipeList = recipes.sorted(by: { $0.mealTitle < $1.mealTitle })
            }
        }
    }
}
