//
//  RecipeDetailsView.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/24/24.
//

import SwiftUI

struct RecipeDetailsView: View {

    @EnvironmentObject var viewModel: RecipeDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let recipeDetails = viewModel.recipeDetails {
                    // Image
                    if let url = recipeDetails.imageURL, let imageURL = URL(string: url) {
                        AsyncImage(url: imageURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 200)
                    }
                    // Title
                    if let title = recipeDetails.title {
                        Text(title)
                            .font(.title)
                    }
                    // Instructions
                    if let instructions = recipeDetails.instructions {
                        Text("Instructions:")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        Text(instructions)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                    }
                    //Ingredients list with measurements
                    Text("Ingredients:")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    VStack(spacing: 8) {
                        ForEach(Array(recipeDetails.ingredients.enumerated()), id: \.offset) { index, ingredient in
                            if let ingredient, let measurement = recipeDetails.measurements[index] {
                                Text("\(ingredient): \(measurement)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.subheadline)
                                    .padding(.leading, 8)
                            }
                        }
                    }
                    // Youtube link
                    if let url = recipeDetails.youtubeLink, let youtubeURL = URL(string: url) {
                        Link("Watch Video", destination: youtubeURL)
                    }
                } else if viewModel.errorFetching {
                    Text("Unable to load recipe details. Please try again later")
                }
            }
        }
        .onAppear {
            viewModel.loadRecipeDetails()
        }
    }
}
