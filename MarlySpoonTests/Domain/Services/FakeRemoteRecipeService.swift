//
//  FakeRemoteRecipeService.swift
//  MarlySpoonTests
//
//  Created by kdeveloper1 on 9/8/21.
//

import Foundation
@testable import MarlySpoon
import Combine

struct FakeRemoteRecipeService: RecipeRepository {
  func getRecipes() -> AnyPublisher<[Recipe], Error> {
    return Future<[Recipe], Error> { promise in
      promise( .success(MockRecipes.recipiesArray))
    }
    .eraseToAnyPublisher()
  }
}
