//
//  RemoteRecipeServices.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Combine
import Contentful

class RemoteRecipeServices: RecipeRepository {
  func getRecipes() -> AnyPublisher<[Recipe], Error> {
    return Future<[Recipe], Error> { promise in
      let contentTypeClasses: [EntryDecodable.Type] = [
        Chef.self,
        Tag.self,
        Recipe.self
      ]
      let client = Client(
        spaceId: "kk2bw5ojx476",
        accessToken: "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c",
        contentTypeClasses: contentTypeClasses)
      client.fetchArray(of: Recipe.self) { (res: Result<HomogeneousArrayResponse<Recipe>, Error>) in
        switch res {
        case .success(let value):
          promise(.success(value.items))
        case .failure(let err):
          promise(.failure(err))
        }
      }
    }.eraseToAnyPublisher()
  }
}
