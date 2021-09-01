//
//  RecipeListRouter.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI

class RecipeListRouter {
  func createRecipeView(for recipe: Recipe) -> some View {
    return RecipeDetailModuleBuilder.build(recipe: recipe)
  }
}
