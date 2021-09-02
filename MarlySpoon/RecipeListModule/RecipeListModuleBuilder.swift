//
//  RecipeListModuleBuilder.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI

/// I use enum type in order to follow lint rule for objects that only host static function it is better use enum rather than classes or structs
enum RecipeListModuleBuilder {
  static func build() -> some View {
    let service = RemoteRecipeServices()
    let interactor = RecipeListInteractor.init(recipeRepository: service)
    let presenter = RecipeListPresenter.init(interactor: interactor)
    return RecipeListView(presenter: presenter)
  }
}
