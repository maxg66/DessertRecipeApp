//
//  RecipeCommunicator.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/23/24.
//

import Foundation

struct RecipeCommunicator {
    
    func loadRecipeList() async -> [RecipeListItem] {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return [] }

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let results = try JSONDecoder().decode(RecipeList.self, from: data)
            return results.meals
        } catch {
            print("Error Decoding: ",error)
            return []
        }
    }

    func loadRecipeDetails(mealID: String) async throws -> RecipeDetails? {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else { return nil }
        
        let request = URLRequest(url: url)

        let (data, _) = try await URLSession.shared.data(for: request)
        let results = try JSONDecoder().decode(Recipe.self, from: data)
        if let recipeDetailsDTO = results.meals.first {
            return RecipeDetails(recipeDetailsDTO: recipeDetailsDTO)
        } else {
            throw CustomError.noResults("No results returned")
        }
    }
}

enum CustomError: Error {
    case noResults(String)
}
