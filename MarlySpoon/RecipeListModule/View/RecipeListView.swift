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
            if presenter.errorState {
              VStack(spacing: 42) {
                Text("Sorry an error has been occurred. please check your Internet connection")
                  .foregroundColor(Color.gray)
                  .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                  .font(.body)
                Spacer()
                Button(action: {
                  presenter.loadData()
                }, label: {
                  Text(" Retry ")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(Color("purpleColor"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                })
              }
            } else {
              ForEach(presenter.recipes) { recipe in
                presenter.linkBuilder(for: recipe) {
                  RecipeCellView(recipe: recipe)
                }
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
    RecipeListModuleBuilder.build()
  }
}
