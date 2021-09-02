//
//  RecipeListPresenter.swift
//  MarlySpoonTests
//
//  Created by Amir Tutunchi on 9/2/21.
//

import XCTest
@testable import MarlySpoon

class RecipeListPresenterTests: XCTestCase {
  var sut: RecipeListPresenter?
  override func setUpWithError() throws {
    try super.setUpWithError()
    let fakeRemoteService = FakeRemoteRecipeService()
    let interactor = RecipeListInteractor.init(recipeRepository: fakeRemoteService)
    sut = RecipeListPresenter.init(interactor: interactor)
  }
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut = nil
  }
  func test_ObjectsGetInitializedCorrectly() {
    XCTAssertNotNil(sut)
    XCTAssertNotNil(sut?.interactor)
    XCTAssertNotNil(sut?.recipes)
    XCTAssertNotNil(sut?.errorState)
  }
}
