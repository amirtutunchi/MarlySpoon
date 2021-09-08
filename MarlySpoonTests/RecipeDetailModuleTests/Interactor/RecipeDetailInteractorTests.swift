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
    systemUnderTest = RecipeDetailInteractor.init(recipe: MockRecipes.recipe )
  }
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    systemUnderTest = nil
  }
  func test_Init_ObjectGetInitializedCorrectly() {
    XCTAssert(systemUnderTest?.recipe.title == MockRecipes.recipe.title)
    XCTAssert(systemUnderTest?.recipe.chef?.name == MockRecipes.recipe.chef?.name)
  }
}
