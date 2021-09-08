//
//  RecipeListModuleBuilder.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import SwiftUI
import Contentful

/// I use enum type in order to follow lint rule for objects that only host static function it is better use enum rather than classes or structs
enum RecipeListModuleBuilder {
  static func build() -> some View {
    let contentTypeClasses: [EntryDecodable.Type] = [
      Chef.self,
      Tag.self,
      Recipe.self
    ]
    let client = Client(
      spaceId: "kk2bw5ojx476",
      accessToken: "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c",
      contentTypeClasses: contentTypeClasses)
    let service = RemoteRecipeServices(client: client)
    let interactor = RecipeListInteractor.init(recipeRepository: service)
    let presenter = RecipeListPresenter.init(interactor: interactor)
    return RecipeListView(presenter: presenter)
  }
}
