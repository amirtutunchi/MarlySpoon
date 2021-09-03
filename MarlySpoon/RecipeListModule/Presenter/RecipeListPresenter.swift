//
//  RecipeListPresenter.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Combine
import SwiftUI

class RecipeListPresenter: ObservableObject {
  let interactor: RecipeListInteractor
  /// this property use for rendering recipes on screen
  @Published var recipes: [Recipe] = []
  /// if we have error we change this boolean to true and in the view we show nice error text and a retry button
  @Published var errorState = false
  private var cancellables = Set<AnyCancellable>()
  private let router = RecipeListRouter()
  init(interactor: RecipeListInteractor) {
    self.interactor = interactor
    loadData()
  }
  /// use this function to command interactor to load data
  func loadData(completion: @escaping () -> Void = {}) {
    interactor.getAllRecipes()
      .receive(on: RunLoop.main)
      .sink { [weak self] failure in
        switch failure {
        case .failure(let error):
          print(error)
          self?.errorState = true
        case .finished:
          self?.errorState = false
          completion()
        }
      } receiveValue: { [weak self] allRecipes in
        self?.errorState = false
        self?.recipes = allRecipes
      }
      .store(in: &cancellables)
  }
  /// create navigation link to recipe detail
  /// - Parameters:
  ///   - recipe: selected recipe
  ///   - content: desired view
  /// - Returns: some view
  func linkBuilder<Content: View>(for recipe: Recipe, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(
      destination: router.createRecipeView(for: recipe)) {
      content()
    }
  }
}
