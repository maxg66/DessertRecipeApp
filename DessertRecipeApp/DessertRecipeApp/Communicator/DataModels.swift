//
//  DataModels.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/23/24.
//

import Foundation

struct RecipeList: Decodable {
    let meals: [RecipeListItem]
}

struct RecipeListItem: Decodable {
    let mealTitle: String
    let imageURL: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case mealTitle = "strMeal"
        case imageURL = "strMealThumb"
        case id = "idMeal"
    }
}

struct Recipe: Decodable {
    let meals: [RecipeDetailsDTO]
}
struct RecipeDetailsDTO: Decodable {
    let strMeal: String?
    let strMealThumb: String?
    let strInstructions: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}

struct RecipeDetails {
    let title: String?
    let instructions: String?
    let youtubeLink: String?
    let imageURL: String?
    let ingredients: [String?]
    let measurements: [String?]
    init(recipeDetailsDTO: RecipeDetailsDTO) {
        title = recipeDetailsDTO.strMeal
        instructions = recipeDetailsDTO.strInstructions
        youtubeLink = recipeDetailsDTO.strYoutube
        imageURL = recipeDetailsDTO.strMealThumb
        ingredients = [
            recipeDetailsDTO.strIngredient1,
            recipeDetailsDTO.strIngredient2,
            recipeDetailsDTO.strIngredient3,
            recipeDetailsDTO.strIngredient4,
            recipeDetailsDTO.strIngredient5,
            recipeDetailsDTO.strIngredient6,
            recipeDetailsDTO.strIngredient7,
            recipeDetailsDTO.strIngredient8,
            recipeDetailsDTO.strIngredient9,
            recipeDetailsDTO.strIngredient10,
            recipeDetailsDTO.strIngredient11,
            recipeDetailsDTO.strIngredient12,
            recipeDetailsDTO.strIngredient13,
            recipeDetailsDTO.strIngredient14,
            recipeDetailsDTO.strIngredient15,
            recipeDetailsDTO.strIngredient16,
            recipeDetailsDTO.strIngredient17,
            recipeDetailsDTO.strIngredient18,
            recipeDetailsDTO.strIngredient19,
            recipeDetailsDTO.strIngredient20
        ].filter {
            if let ingredient = $0 {
                return !ingredient.isEmpty
            } else {
                return false
            }
        }
        measurements = [
            recipeDetailsDTO.strMeasure1,
            recipeDetailsDTO.strMeasure2,
            recipeDetailsDTO.strMeasure3,
            recipeDetailsDTO.strMeasure4,
            recipeDetailsDTO.strMeasure5,
            recipeDetailsDTO.strMeasure6,
            recipeDetailsDTO.strMeasure7,
            recipeDetailsDTO.strMeasure8,
            recipeDetailsDTO.strMeasure9,
            recipeDetailsDTO.strMeasure10,
            recipeDetailsDTO.strMeasure11,
            recipeDetailsDTO.strMeasure12,
            recipeDetailsDTO.strMeasure13,
            recipeDetailsDTO.strMeasure14,
            recipeDetailsDTO.strMeasure15,
            recipeDetailsDTO.strMeasure16,
            recipeDetailsDTO.strMeasure17,
            recipeDetailsDTO.strMeasure18,
            recipeDetailsDTO.strMeasure19,
            recipeDetailsDTO.strMeasure20
        ].filter {
            if let measurement = $0 {
                return !measurement.isEmpty
            } else {
                return false
            }
        }
    }
}
