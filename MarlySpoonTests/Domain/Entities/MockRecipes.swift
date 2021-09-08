//
//  MockRecipes.swift
//  MarlySpoonTests
//
//  Created by kdeveloper1 on 9/8/21.
//

import Foundation
@testable import MarlySpoon

enum MockRecipes {
 static  let chef = Chef.init(name: "John Doe")
 static let recipe = Recipe.init(
    title: "Chicken Grill",
    description: "this food is one of the best food in world",
    chef: chef,
    tags: [])
  static let recipiesArray = [recipe , recipe]
}
