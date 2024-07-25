//
//  DessertRecipeAppApp.swift
//  DessertRecipeApp
//
//  Created by Maxwell Giffin on 7/23/24.
//

import SwiftUI

@main
struct DessertRecipeAppApp: App {
    @ObservedObject var viewModel = RecipeListViewModel()

    var body: some Scene {
        WindowGroup {
            RecipeListView()
                .environmentObject(viewModel)
        }
    }
}
