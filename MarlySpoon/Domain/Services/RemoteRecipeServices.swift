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
  let client: Client
  init(client: Client) {
    self.client = client
  }
  func getRecipes() -> AnyPublisher<[Recipe], Error> {
    return Future<[Recipe], Error> {[weak self] promise in
      self?.client.fetchArray(of: Recipe.self) { (res: Result<HomogeneousArrayResponse<Recipe>, Error>) in
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
