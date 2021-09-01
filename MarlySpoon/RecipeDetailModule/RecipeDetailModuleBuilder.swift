//
//  RecipeDetailModuleBuilder.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI

enum RecipeDetailModuleBuilder {
  static func build(recipe: Recipe) -> some View {
    let interactor = RecipeDetailInteractor.init(recipe: recipe)
    let presenter = RecipeDetailPresenter.init(interactor: interactor)
    return RecipeDetailView(presenter: presenter)
  }
}
