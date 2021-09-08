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
  func test_LoadData_Currectly() {
    let expectation = XCTestExpectation(description: "Publishes values then finishes")
    sut?.loadData {
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 0.5)
    XCTAssert(sut?.recipes.count == 2)
  }
}
