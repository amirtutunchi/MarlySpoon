//
//  RecipeListView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI

struct RecipeListView: View {
  @ObservedObject var presenter: RecipeListPresenter
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          HStack {
            Text("What Do You Want Cooking Today!")
              .foregroundColor(Color.gray)
              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
              .font(.title)
              .lineLimit(4)
            Image("Chef")
              .resizable()
              .aspectRatio(contentMode: .fit)
          }
          VStack(alignment: .leading, spacing: 16) {
            Text("All Recipes")
              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
              .font(.title)
            ForEach(presenter.recipes) { recipe in
              presenter.linkBuilder(for: recipe) {
                RecipeCellView(recipe: recipe)
              }
            }
          }
          .padding(.vertical, 1.0)
          Spacer()
        }
        .padding()
        .navigationBarHidden(true)
        .statusBar(hidden: true)
      }
    }
  }
}

struct RecipeListView_Previews: PreviewProvider {
  static var previews: some View {
    let service = RemoteRecipeServices()
    let interactor = RecipeListInteractor.init(recipeRepository: service)
    let presenter = RecipeListPresenter.init(interactor: interactor)
    RecipeListView(presenter: presenter)
      .preferredColorScheme(.dark)
  }
}
