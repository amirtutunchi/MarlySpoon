//
//  RecipeDetailPresenter.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Combine

class RecipeDetailPresenter: ObservableObject {
  let interactor: RecipeDetailInteractor
  init(interactor: RecipeDetailInteractor) {
    self.interactor = interactor
  }
  var recipe: Recipe {
    return interactor.recipe
  }
}
