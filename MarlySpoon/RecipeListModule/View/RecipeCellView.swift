//
//  RecipeCellView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI
import Kingfisher

struct RecipeCellView: View {
  var recipe: Recipe
  var body: some View {
    HStack(alignment: .center) {
      Text(recipe.title ?? "")
        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .lineLimit(4)
        .foregroundColor(Color("textColor"))
      Spacer()
      KFImage.init(recipe.photo?.url)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(16)
    }
    .background(Color("lightGray"))
    .cornerRadius(16)
  }
}

struct RecipeCellView_Previews: PreviewProvider {
  static var previews: some View {
    let chef = Chef.init(name: "John Doe")
    let recipe = Recipe.init(
      title: "Chicken Grill",
      description: "this food is one of the best food in world",
      chef: chef,
      tags: [])
    RecipeCellView(recipe: recipe)
  }
}
