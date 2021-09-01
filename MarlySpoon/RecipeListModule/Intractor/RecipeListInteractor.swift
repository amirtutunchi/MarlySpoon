//
//  RecipeListInteractor.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Combine

class RecipeListInteractor {
  let recipeRepository: RecipeRepository
  init(recipeRepository: RecipeRepository) {
    self.recipeRepository = recipeRepository
  }
  func getAllRecipes() -> AnyPublisher<[Recipe], Error> {
    return self.recipeRepository.getRecipes()
  }
}
