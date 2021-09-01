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
  private var cancellables = Set<AnyCancellable>()
  private let router = RecipeListRouter()
  init(interactor: RecipeListInteractor) {
    self.interactor = interactor
    interactor.getAllRecipes()
      .receive(on: RunLoop.main)
      .sink { err in
        print(err)
      } receiveValue: { [weak self] allRecipes in
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
