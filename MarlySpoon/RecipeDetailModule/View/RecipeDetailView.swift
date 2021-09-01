//
//  RecipeDetailView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI
import Kingfisher

struct RecipeDetailView: View {
  var presenter: RecipeDetailPresenter
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 1.0) {
        KFImage.init(presenter.recipe.photo?.url)
          .resizable()
          .frame(height: 250)
          .scaledToFit()
        VStack(spacing: 12.0) {
          Text(presenter.recipe.title ?? "Unknown Food")
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("textColor")/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.leading)
            .lineLimit(4)
          if let chef = presenter.recipe.chef {
            ChefView(chef: chef)
              .padding(.leading)
              .frame(maxWidth: .infinity)
          }
          Divider()
            .background(Color(.gray))
          if let description = presenter.recipe.description {
            DescriptionView(description: description)
            Divider()
              .background(Color(.gray))
          }
          if let tags = presenter.recipe.tags {
            TagView()
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(tags) { tag in
                  TagCapsuleView(tag: tag)
                }
              }
            }.frame(height: 50)
          }
        }.padding(20.0)
      }
      Spacer()
    }
    .statusBar(hidden: true)
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let chef = Chef.init(name: "John Doe")
    let recipe = Recipe.init(
      title: "Chicken Grill",
      description: "this food is one of the best food in world",
      chef: chef,
      tags: [])
    let interactor = RecipeDetailInteractor.init(recipe: recipe)
    let presenter = RecipeDetailPresenter.init(interactor: interactor)
    RecipeDetailView(presenter: presenter)
  }
}
