//
//  RecipeDetailModuleBuilder.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI

/// I use enum type in order to follow lint rule for objects that only host static function it is better use enum rather than classes or structs
enum RecipeDetailModuleBuilder {
  static func build(recipe: Recipe) -> some View {
    let interactor = RecipeDetailInteractor.init(recipe: recipe)
    let presenter = RecipeDetailPresenter.init(interactor: interactor)
    return RecipeDetailView(presenter: presenter)
  }
}
