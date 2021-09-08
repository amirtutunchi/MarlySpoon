//
//  RecipeListInteractorTests.swift
//  MarlySpoonTests
//
//  Created by Amir Tutunchi on 9/2/21.
//

import XCTest
import Combine
@testable import MarlySpoon

class RecipeListInteractorTests: XCTestCase {
  var systemUnderTest: RecipeListInteractor?
  let fakeRemoteService = FakeRemoteRecipeService()
  private var cancellables = Set<AnyCancellable>()

  override func setUp() {
    super.setUp()
    systemUnderTest = RecipeListInteractor.init(recipeRepository: fakeRemoteService)
  }
  func test_getAllRecipe_ReturnDataCorrectly() {
    let expectation = XCTestExpectation(description: "Publish finish without any error")

    systemUnderTest?.getAllRecipes()
      .sink { failure in
        if case .finished = failure {
          expectation.fulfill()
        } else {
          XCTAssert(false, "subscription does not finished without any error")
        }
      } receiveValue: { recipes in
        XCTAssert(recipes.count == 2)
        XCTAssert(recipes[0].title == "Chicken Grill")
      }
      .store(in: &cancellables)
  }
}

struct FakeRemoteRecipeService: RecipeRepository {
  func getRecipes() -> AnyPublisher<[Recipe], Error> {
    let chef = Chef.init(name: "John Doe")
    let recipe = Recipe.init(
      title: "Chicken Grill",
      description: "this food is one of the best food in world",
      chef: chef,
      tags: [])
    return Future<[Recipe], Error> { promise in
      promise( .success([recipe, recipe]))
    }
    .eraseToAnyPublisher()
  }
}
