//
//  RecipeListModuleBuilder.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI

enum RecipeListModuleBuilder {
  static func build() -> some View {
    let service = RemoteRecipeServices()
    let interactor = RecipeListInteractor.init(recipeRepository: service)
    let presenter = RecipeListPresenter.init(interactor: interactor)
    return RecipeListView(presenter: presenter)
  }
}
