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
    let chef = Chef.init(name: "John Doe")
    let recipe = Recipe.init(
      title: "Chicken Grill",
      description: "this food is one of the best food in world",
      chef: chef,
      tags: [])
    let recipeDetailView = systemUnderTest.createRecipeView(for: recipe)
    XCTAssert(recipeDetailView is RecipeDetailView)
  }
}
