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
  @Published var recipes: [Recipe] = []
  @Published var errorState = false
  private var cancellables = Set<AnyCancellable>()
  private let router = RecipeListRouter()
  init(interactor: RecipeListInteractor) {
    self.interactor = interactor
    loadData()
  }
  func loadData() {
    interactor.getAllRecipes()
      .receive(on: RunLoop.main)
      .sink { [weak self] failure in
        switch failure {
        case .failure(let error):
          print(error)
          self?.errorState = true
        case .finished:
          self?.errorState = false
        }
      } receiveValue: { [weak self] allRecipes in
        self?.errorState = false
        self?.recipes = allRecipes
      }
      .store(in: &cancellables)
  }
  func linkBuilder<Content: View>(for recipe: Recipe, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(
      destination: router.createRecipeView(for: recipe)) {
      content()
    }
  }
}
