//
//  RecipeDetailInteractorTests.swift
//  MarlySpoonTests
//
//  Created by Amir Tutunchi on 9/3/21.
//

import XCTest
@testable import MarlySpoon

class RecipeDetailInteractorTests: XCTestCase {
  var systemUnderTest: RecipeDetailInteractor?
  var recipe: Recipe?
  override func setUpWithError() throws {
    try super.setUpWithError()
    let chef = Chef.init(name: "John Doe")
    recipe = Recipe.init(
      title: "Chicken Grill",
      description: "this food is one of the best food in world",
      chef: chef,
      tags: [])
    if let recipe = recipe {
      systemUnderTest = RecipeDetailInteractor.init(recipe: recipe )
    }
  }
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    systemUnderTest = nil
  }
  func test_Init_ObjectGetInitializedCorrectly() {
    XCTAssert(systemUnderTest?.recipe.title == recipe?.title)
    XCTAssert(systemUnderTest?.recipe.chef?.name == recipe?.chef?.name)
  }
}
