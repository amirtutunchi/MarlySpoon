//
//  RecipeListRouterTests.swift
//  MarlySpoonTests
//
//  Created by Amir Tutunchi on 9/3/21.
//

import XCTest
@testable import MarlySpoon
class RecipeListRouterTests: XCTestCase {
  func test_CreateRecipeView_InitialCorrectly() {
    let systemUnderTest = RecipeListRouter.init()
    let recipeDetailView = systemUnderTest.createRecipeView(for: MockRecipes.recipe)
    XCTAssert(recipeDetailView is RecipeDetailView)
  }
}
