//
//  RecipeRepository.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Combine

protocol RecipeRepository {
  func getRecipes() -> AnyPublisher<[Recipe], Error>
}
