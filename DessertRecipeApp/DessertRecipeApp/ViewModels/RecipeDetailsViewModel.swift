//
//  RecipeDetailsViewModel.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/24/24.
//

import Foundation

class RecipeDetailsViewModel: ObservableObject {

    @Published private(set) var recipeDetails: RecipeDetails? = nil
    @Published private(set) var errorFetching: Bool = false
    private let communicator = RecipeCommunicator()
    private let mealID: String

    init(mealID: String) {
        self.mealID = mealID
    }

    func loadRecipeDetails() {
        Task {
            do {
                let details = try await communicator.loadRecipeDetails(mealID: mealID)
                await MainActor.run {
                    recipeDetails = details
                }
            } catch {
                await MainActor.run {
                    errorFetching = true
                }
            }
        }
    }
}
